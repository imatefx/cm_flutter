import 'package:cm_flutter/app/models/absense_list_response.dart';
import 'package:cm_flutter/app/modules/absense_manager/controllers/absense_manager_list_ctrl.dart';
import 'package:cm_flutter/app/modules/absense_manager/views/absense_list_card_view.dart';
import 'package:cm_flutter/app/modules/absense_manager/views/custom_date_picker_btn_view.dart';
import 'package:cm_flutter/app/modules/absense_manager/views/custom_drop_down_btn_view.dart';
import 'package:cm_flutter/app/modules/absense_manager/views/empty_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

class AbsenseManagerListPage extends StatelessWidget {
  const AbsenseManagerListPage({super.key});

  // const AbsenseManagerListPage({super.key});
  @override
  Widget build(context) {
    AbsenseManagerListController absenseManagerListController =
        Get.isRegistered<AbsenseManagerListController>()
            ? Get.find<AbsenseManagerListController>()
            : Get.put(AbsenseManagerListController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Absense List"),
        scrolledUnderElevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  return CustomDatepickerBtnView(
                    onTap: () {
                      absenseManagerListController
                          .onDatePickerBtnClick(context);
                    },
                    label: absenseManagerListController
                                .absenseListRequest.value.selectedDate ==
                            null
                        ? "Select Date"
                        : DateFormat('yyyy-MM-dd').format(
                            absenseManagerListController
                                .absenseListRequest.value.selectedDate!),
                  );
                }),
                Obx(() {
                  return CustomDropdownBtnView(
                    currentValue: absenseManagerListController
                        .absenseListRequest.value.absenceType,
                    values: absenseManagerListController.types,
                    onChanged: (value) {
                      absenseManagerListController.setSelectedType(value);
                    },
                  );
                }),
                TextButton(
                    onPressed: () {
                      absenseManagerListController.onClearFilterBtnClick();
                    },
                    child: const Text("Clear"))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() {
              if (absenseManagerListController
                      .absenseListResponse.value.total !=
                  0) {
                return Text(
                    'Loaded ${absenseManagerListController.absenseListRequest.value.page ?? 0} of ${absenseManagerListController.absenseListResponse.value.totalPages ?? ''} page , Total ${absenseManagerListController.absenseListResponse.value.total ?? ''} records');
              } else {
                return SizedBox.shrink();
              }
            }),
            Flexible(
              child: PagedGridView<int, AbsenseListModel>(
                showNewPageProgressIndicatorAsGridChild: true,
                showNewPageErrorIndicatorAsGridChild: true,
                showNoMoreItemsIndicatorAsGridChild: true,
                shrinkWrap: true,
                pagingController:
                    absenseManagerListController.absenseListPagingController,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 400 / 250,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  maxCrossAxisExtent: 400,
                  // crossAxisCount: 5,
                ),
                builderDelegate: PagedChildBuilderDelegate<AbsenseListModel>(
                    itemBuilder: (context, absenseListModel, index) =>
                        AbsenseListCardView(
                            absenseListModel: absenseListModel, onTap: () {}),
                    firstPageErrorIndicatorBuilder: (context) {
                      return const Center(
                          child: Text("Oops! something went wrong!"));
                    },
                    noItemsFoundIndicatorBuilder: (context) {
                      return EmptyListView(
                        onClearFilterBtnClick: () {
                          absenseManagerListController.onClearFilterBtnClick();
                        },
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
