import 'dart:convert';

class EventModel {
  String? eventTitle;
  String? eventDate;
  String? startTime;
  String? endTime;
  String? url;
  String? eventCreated;

  EventModel(
      {this.eventTitle,
      this.startTime,
      this.endTime,
      this.eventDate,
      this.url,
      this.eventCreated});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      eventTitle: json["eventTitle"] ?? "N/A",
      eventDate: json["eventDate"] ?? DateTime.now().toString(),
      startTime: json["startTime"] ?? "N/A",
      endTime: json["endTime"] ?? "N/A",
      url: json["url"] ?? "N/A",
      eventCreated: json["eventCreated"] ?? DateTime.now().toString(),
    );
  }

  static String saveEvent(EventModel event) {
    var map = {
      'eventTitle': event.eventTitle,
      'eventDate': event.eventDate,
      'startTime': event.startTime,
      'endTime': event.endTime,
      'url': event.url,
      'eventCreated': event.eventCreated
    };

    return json.encode(map);
  }
}
