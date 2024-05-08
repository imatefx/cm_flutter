import 'package:cm_flutter/app/helpers/constants.dart';
import 'package:cm_flutter/app/models/absense_list_request.dart';
import 'package:cm_flutter/app/models/absense_list_response.dart';
import 'package:cm_flutter/app/system/result.dart';
import 'package:get/get.dart';

class AbsenseListProvider extends GetConnect{
  Future<Result<AbsenseListResponse, Exception, Exception, Exception>>
  getAbsenseList(AbsenseListRequest data) async {
    final response =
    await post('${BASE_URL}v1/absences/listWithMembers', data.toJson());

    switch (response.statusCode) {
      case 200:
        return Success(AbsenseListResponse.fromMap(response.body), response,
            data.toMap());
      case 422:
        return ValidationFailure(response, data.toJson());
      case null:
        return NewtorkFailure(response, data.toJson());
      default:
        return ApiFailure(response, data.toJson());
    }
  }

}