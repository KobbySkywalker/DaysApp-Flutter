import 'package:days/api/apiUrl.dart';
import 'package:days/services/httpRequest/failedResponse.dart';
import 'package:days/services/httpRequest/successResponse.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as client;

class DeleteRequest {
  static Future<Object> delete(String url) async {
    try {
      var response = await client.delete(Uri.parse(url),
          headers: APIURL.headerWithoutToken);
      var decodedReponse = json.decode(response.body);
      print(url);
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
