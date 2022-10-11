import 'package:days/services/httpRequest/responseCodes.dart';
import 'package:flutter/material.dart';

class FailedResponse {
  int? responseCode;
  Object? response;
  Color? errorColor;
  FailedResponse(
      {this.responseCode, this.errorColor = Colors.redAccent, this.response});

  static FailedResponse get failedNetwork {
    return FailedResponse(
        errorColor: Colors.blueGrey,
        responseCode: NO_INTERNET_CODE,
        response:
            "Poor or no internet connection. Please check your internet connection and try again.");
  }

  static FailedResponse get unknownError {
    return FailedResponse(
        responseCode: UNKNOWN_ERROR_CODE,
        response: "An unknown error occurred. Please try again later");
  }

  static FailedResponse get invalidFormatError {
    return FailedResponse(
        responseCode: INVALID_FORMAT_CODE,
        response: "Something went wrong. Please try again later");
  }
}
