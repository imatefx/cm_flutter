import 'package:cm_flutter/app/system/api_error.dart';
import 'package:cm_flutter/app/system/api_metadata.dart';
import 'package:cm_flutter/app/system/validation_error.dart';
import 'package:get/get.dart';

/// Base Result class
/// [S] represents the type of the success value
/// [E] should be [Exception] or a subclass of it
// sealed class Result<S, E extends Exception, NE extends Exception> {
sealed class Result<S, VE extends Exception, AE extends Exception,
    NE extends Exception> {
  const Result();
}

final class Success<S, VE extends Exception, AE extends Exception,
    NE extends Exception> extends Result<S, VE, AE, NE> {
  late final ApiMetadata metadata;

  Success(this.value, Response response, dynamic reqData) {
    this.metadata = ApiMetadata(
        message: "API Request Success",
        url: response.request?.url.toString(),
        code: response.statusCode,
        resBody: this.value,
        reqBody: reqData);
  }
  final S value;
}

final class ValidationFailure<S, VE extends Exception, AE extends Exception,
    NE extends Exception> extends Result<S, VE, AE, NE> {
  late final ApiMetadata metadata;

  ValidationFailure(Response response, dynamic reqData) {
    this.metadata = ApiMetadata(
        message: "Paramater validation error occured.",
        url: response.request?.url.toString(),
        code: response.statusCode,
        resBody: ValidationError.fromRawJson(response.bodyString ?? ""),
        reqBody: reqData);
    this.exception = Exception(metadata.message) as VE;
  }
  late final VE exception;
}

final class ApiFailure<S, VE extends Exception, AE extends Exception,
    NE extends Exception> extends Result<S, VE, AE, NE> {
  late final ApiMetadata metadata;

  ApiFailure(Response response, dynamic reqData) {
    this.metadata = ApiMetadata(
        message: "API Internal Error.",
        url: response.request?.url.toString(),
        code: response.statusCode,
        resBody: ApiError.fromRawJson(response.bodyString ?? ""),
        reqBody: reqData);
    this.exception = Exception(metadata.message) as AE;
  }
  late final AE exception;
}

final class NewtorkFailure<S, VE extends Exception, AE extends Exception,
    NE extends Exception> extends Result<S, VE, AE, NE> {
  late final ApiMetadata metadata;

  NewtorkFailure(Response response, dynamic reqData) {
    this.metadata = ApiMetadata(
        message: "Error contacting server.",
        url: response.request?.url.toString(),
        code: response.statusCode,
        resBody: null,
        reqBody: reqData);

    this.exception = Exception(metadata.message) as NE;
  }
  late final NE exception;
}
