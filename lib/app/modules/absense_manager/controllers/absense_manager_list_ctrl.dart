import 'package:cm_flutter/app/models/absense_list_request.dart';
import 'package:cm_flutter/app/models/absense_list_response.dart';
import 'package:cm_flutter/app/modules/absense_manager/providers/absense_list_provider.dart';
import 'package:cm_flutter/app/system/result.dart';
import 'package:cm_flutter/app/utils/message_displayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AbsenseManagerListController extends GetxController {
  final types = ['sickness', 'vacation'];

  late AbsenseListProvider absenseListProvider;

  var absenseListRequest = AbsenseListRequest().obs;
  var absenseListResponse = AbsenseListResponse().obs;

  // for absense list pagination
  int pageSize = 10;
  bool isAbsenseListLastPage = false;
  final PagingController<int, AbsenseListModel> absenseListPagingController =
      PagingController(firstPageKey: 1);

  @override
  void onInit() {
    absenseListProvider = Get.put(AbsenseListProvider());
    absenseListPagingController.addPageRequestListener((pageKey) {
      if (!isAbsenseListLastPage) {
        getAbsenseListData(page: pageKey);
      }
    });

    super.onInit();
  }

  Future<void> onDatePickerBtnClick(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: absenseListRequest.value.selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != absenseListRequest.value.selectedDate) {
      absenseListRequest.value.selectedDate = picked;
      absenseListRequest.refresh();
      absenseListPagingController.itemList?.clear();
      // absenseListPagingController.refresh();
      getAbsenseListData(page: 1);
    }
  }

  setSelectedType(String? value) {
    absenseListRequest.value.absenceType = value;
    absenseListRequest.refresh();
    absenseListPagingController.itemList?.clear();
    // absenseListPagingController.refresh();
    getAbsenseListData(page: 1);
  }

  onClearFilterBtnClick() {
    absenseListRequest.value = AbsenseListRequest();
    absenseListPagingController.refresh();
    getAbsenseListData(page: 1);
  }

  void getAbsenseListData({int page = 1}) async {
    absenseListRequest.value.page = page;
    absenseListRequest.value.toDate = absenseListRequest.value.selectedDate
        ?.add(Duration(hours: 23, minutes: 59))
        .toIso8601String();
    absenseListRequest.value.fromDate =
        absenseListRequest.value.selectedDate?.toIso8601String();
    absenseListRequest.value.pageSize = pageSize;
    Result<AbsenseListResponse, Exception, Exception, Exception> result =
        await absenseListProvider.getAbsenseList(absenseListRequest.value);

    final apiResultFn = switch (result) {
      Success(value: final res) => () {
          isAbsenseListLastPage = page >= (res.totalPages ?? 1);

          if (isAbsenseListLastPage) {
            absenseListPagingController.appendLastPage(res.rows!);
          } else {
            absenseListPagingController.appendPage(res.rows!, page + 1);
          }
          absenseListResponse.value = res;
        },
      ApiFailure(exception: final exception, metadata: final meta) => () {
          if (meta.code == 401) {
            Get.showSnackbar(GetSnackBar(
              title: meta.resBody.message,
              message: 'Something went wrong: $exception',
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red,
            ));
          } else {
            MessageDisplayer.apiFailureMessageDisplay(exception);
          }
          absenseListPagingController.error = exception;
        },
      ValidationFailure(exception: final exception) => () {
          MessageDisplayer.validationFailureMessageDisplay(exception);
          absenseListPagingController.error = exception;
        },
      NewtorkFailure(exception: final exception) => () {
          MessageDisplayer.networkFailureMessageDisplay(exception);
          absenseListPagingController.error = exception;
        },
    };

    apiResultFn();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
