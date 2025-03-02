import 'package:quran/core/exception/app_exception.dart';

import '../repositories/meta_response_model.dart';

class MetaExceptionHandler {
  final int statusCode;
  final dynamic responseBody;

  MetaExceptionHandler(this.statusCode, this.responseBody);

  String handleByErrorCode() {
    String message =
        MetaResponse.fromJson(responseBody).message ?? "Unknown Error";

    switch (statusCode) {
      case 400:
        throw AppException(message).message;
      case 401:
        throw TokenExpired().message;
      default:
        throw AppException(message).message;
    }
  }
}
