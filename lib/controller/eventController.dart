import 'package:days/pages/createdUpcomingEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:days/models/eventModel.dart';
import 'package:days/pages/savedPreview.dart';
import 'package:days/services/eventServices.dart';
import 'package:days/services/httpRequest/failedResponse.dart';
import 'package:days/services/httpRequest/successResponse.dart';
import 'package:days/widgets/loading_indicator.dart';

class EventController extends ChangeNotifier with EventServices {
  late EventModel eventModel;

  List<EventModel> _event = [];

  List<EventModel> get event => _event;

  void getCreatedEvent(BuildContext context, VoidCallback onFunc) async {
    LoadingIndicator(context, text: "Almost done...").show();
    try {
      var response = await getEvents(context);
      Navigator.pop(context);
      if (response is SuccessResponse) {
        _event = response.response as List<EventModel>;
        _event.sort((a, b) {
          return a.eventCreated!.compareTo(b.eventCreated!);
        });
        print(_event.length);
        notifyListeners();
        onFunc();
      } else if (response is FailedResponse) {
        Navigator.of(context).pop();
        if (response.responseCode == 400) {
          print("ERROR");
          showDialog(
            context: context,
            builder: (ctx) => CupertinoAlertDialog(
              title: const Text("Error Occured"),
              content: Text(response.response.toString()),
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        } else if (response.responseCode == 500) {
          print("HERE");
          Navigator.of(context).pop();
          showDialog(
            context: context,
            builder: (ctx) => CupertinoAlertDialog(
              title: const Text("Error Occured"),
              content: Text(response.response.toString()),
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        }
      }
    } catch (e) {
      print(e.toString);
    }
  }

  void createEvent(EventModel event, BuildContext context) async {
    LoadingIndicator(context, text: "Creating event...").show();
    var response = await addEvent(event, context);
    Navigator.of(context).pop();
    if (response is SuccessResponse) {
      eventModel = (response.response) as EventModel;
      showDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text("Event Created"),
          content: Text("Event has successfully been created"),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                getCreatedEvent(context, () {
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (context) {
                      return SavedPreview();
                    },
                  ));
                });
              },
            )
          ],
        ),
      );
    } else if (response is FailedResponse) {
      Navigator.of(context).pop();
      if (response.responseCode == 400) {
        print("ERROR");
        showDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text("Error Occured"),
            content: Text(response.response.toString()),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      } else if (response.responseCode == 500) {
        print("HERE");
        showDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text("Error Occured"),
            content: Text(response.response.toString()),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      }
    }
  }

  void deleteSingleEvent(BuildContext context, String id) async {
    LoadingIndicator(context, text: "Creating event...").show();
    var response = await deleteEvent(context, id);
    print(response);
    if (response is SuccessResponse) {
      Navigator.of(context).pop();
      // eventModel = (response.response) as EventModel;
      notifyListeners();
      showDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text("Event Deleted"),
          content: Text("Event has successfully been Deleted"),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                getCreatedEvent(context, () {
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (context) {
                      return CreatedUpcomingEvent();
                    },
                  ));
                });
              },
            )
          ],
        ),
      );
    } else if (response is FailedResponse) {
      Navigator.of(context).pop();
      if (response.responseCode == 400) {
        print("ERROR");
        showDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text("Error Occured"),
            content: Text(response.response.toString()),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      } else if (response.responseCode == 500) {
        print("HERE");
        showDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            title: const Text("Error Occured"),
            content: Text(response.response.toString()),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      }
    }
  }

  void getLoadScreen(BuildContext context) async {
    try {
      var response = await getEvents(context);
      if (response is SuccessResponse) {
        _event = response.response as List<EventModel>;
        notifyListeners();
        print(_event.length);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
