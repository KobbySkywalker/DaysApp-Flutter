import 'package:days/api/apiUrl.dart';
import 'package:days/models/welcomeImagesModel.dart';
import 'package:days/services/httpRequest/getRequest.dart';
import 'package:days/services/httpRequest/successResponse.dart';
import 'package:flutter/material.dart';

class WelcomeImageServices {
  Future<List<WeclomeImagesModel>> getSplashImages(BuildContext context) async {
    var response = await GetRequest(context).get(APIURL
        .getUrl("?client_id=${APIURL.clientId}&per_page=${APIURL.perPage}"));
    if (response is SuccessResponse) {
      return List<WeclomeImagesModel>.from((response.response as List).map((e) {
        return WeclomeImagesModel.fromJson(e);
      }));
    } else {
      return [];
    }
  }

  Future<List<WeclomeImagesModel>> loadBackgroundImages(
      BuildContext context) async {
    var response = await GetRequest(context).get(APIURL.getUrl(
        "?client_id=${APIURL.clientId}&per_page=${APIURL.perBackgroundPage}"));
    if (response is SuccessResponse) {
      return List<WeclomeImagesModel>.from((response.response as List).map((e) {
        return WeclomeImagesModel.fromJson(e);
      }));
    } else {
      return [];
    }
  }
}
