import 'package:days/services/httpRequest/successResponse.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as client;

import '../../api/apiUrl.dart';
import 'failedResponse.dart';

class GetRequest {
  BuildContext context;
  GetRequest(this.context);

  Future<Object> get(String url) async {
    print(url);
    try {
      var response =
          await client.get(Uri.parse(url), headers: APIURL.headerWithToken());
      var decodedReponse = json.decode(response.body);
      if (kDebugMode) {
        print(response.body);
      }
      return SuccessResponse(
          response: decodedReponse, responseCode: response.statusCode);
    } on HttpException {
      return FailedResponse.failedNetwork;
    } on SocketException {
      return FailedResponse.failedNetwork;
    } on FormatException {
      return FailedResponse.invalidFormatError;
    } catch (e) {
      return FailedResponse.unknownError;
    }
  }
}
