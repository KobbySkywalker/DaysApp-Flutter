import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as client;
import 'package:days/api/apiUrl.dart';
import 'package:days/services/httpRequest/failedResponse.dart';
import 'package:days/services/httpRequest/successResponse.dart';
import 'package:days/utils/utils.dart';

class PostRequest {
  BuildContext context;
  PostRequest(this.context);

  Future<Object> postRequest(String url, String body) async {
    try {
      var response = await client.post(Uri.parse(url),
          body: body, headers: APIURL.headerWithoutToken);

      var decodedReponse = json.decode(response.body);
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
