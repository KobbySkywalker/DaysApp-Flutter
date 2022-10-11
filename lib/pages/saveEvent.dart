import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:days/controller/eventController.dart';
import 'package:days/controller/welcomeImageController.dart';
import 'package:days/models/eventModel.dart';
import 'package:days/pages/savedPreview.dart';
import 'package:days/widgets/appBarWidget.dart';

class SaveEvent extends StatefulWidget {
  final String url;
  const SaveEvent({Key? key, required this.url}) : super(key: key);

  @override
  State<SaveEvent> createState() => _SaveEventState();
}

class _SaveEventState extends State<SaveEvent> {
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<WelcomeImageController>(context);
    var eventController = Provider.of<EventController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        onTap: () {
          Navigator.pop(context);
        },
        title: "Save Event",
        icon: Icons.arrow_back_ios,
        child: Padding(
          padding: const EdgeInsets.only(right: 18),
          child: InkWell(
            onTap: () {
              var event = EventModel(
                  eventTitle: controller.eventTitle,
                  startTime: controller.startTime,
                  endTime: controller.endTime,
                  eventDate: controller.date,
                  url: widget.url,
                  eventCreated: DateTime.now().toString());
              if (controller.eventTitle.isNotEmpty) {
                controller.setImageUrl(widget.url);
                controller.setEventDateCreated(DateTime.now().toString());
                eventController.createEvent(event, context);
              } else {
                print("ERROR HERE");
              }
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 12, right: 12, top: 18),
              child: Text(
                "Save",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: CachedNetworkImage(
          imageUrl: widget.url,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
          placeholder: (context, url) {
            return SizedBox(
              height: 30,
              width: 30,
              child: spinner(color: const Color.fromARGB(255, 93, 155, 206)),
            );
          },
        ),
      ),
    );
  }
}

Widget spinner({Color color = Colors.white, bool isBoth = false}) {
  if (isBoth) {
    return CircularProgressIndicator(
      strokeWidth: 1.85,
      valueColor: AlwaysStoppedAnimation(color),
    );
  } else {
    return Platform.isAndroid
        ? CircularProgressIndicator(
            strokeWidth: 1.85,
            valueColor: AlwaysStoppedAnimation(color),
          )
        : const CupertinoActivityIndicator();
  }
}
