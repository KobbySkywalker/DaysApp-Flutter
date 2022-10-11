import 'package:flutter/material.dart';
import 'package:days/api/apiUrl.dart';
import 'package:days/models/eventModel.dart';
import 'package:days/services/httpRequest/failedResponse.dart';
import 'package:days/services/httpRequest/getRequest.dart';
import 'package:days/services/httpRequest/postRequest.dart';
import 'package:days/services/httpRequest/successResponse.dart';

class EventServices {
  Future<Object?> getEvents(BuildContext context) async {
    var response = await GetRequest(context).get(APIURL.url("api/get-events"));
    print(response);
    if (response is SuccessResponse) {
      return SuccessResponse(
        response: List<EventModel>.from((response.response as List).map((e) {
          return EventModel.fromJson(e);
        })),
        responseCode: response.responseCode,
      );
    } else if (response is FailedResponse) {
      return FailedResponse(
        response: response.response,
        responseCode: response.responseCode,
      );
    }
    return null;
  }

  Future<Object?> addEvent(EventModel event, BuildContext context) async {
    var body = EventModel.saveEvent(event);
    var response = await PostRequest(context)
        .postRequest(APIURL.url("api/add-event"), body);
    if (response is SuccessResponse) {
      return SuccessResponse(
        response:
            EventModel.fromJson((response.response) as Map<String, dynamic>),
        responseCode: response.responseCode,
      );
    } else if (response is FailedResponse) {
      print(response.response);
      return FailedResponse(
        response: response.response,
        responseCode: response.responseCode,
      );
    }
    return null;
  }
}
