import 'dart:io';

import 'package:days/pages/detailedEventPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:days/controller/eventController.dart';
import 'package:days/pages/createEventPage.dart';
import 'package:days/utils/dateFormatter.dart';
import 'package:days/utils/utils.dart';
import 'package:days/widgets/appBarWidget.dart';
import 'package:days/widgets/photocards.dart';

class CreatedUpcomingEvent extends StatefulWidget {
  CreatedUpcomingEvent({Key? key}) : super(key: key);

  @override
  State<CreatedUpcomingEvent> createState() => _CreatedUpcomingEventState();
}

class _CreatedUpcomingEventState extends State<CreatedUpcomingEvent> {
  @override
  Widget build(BuildContext context) {
    var eventController = Provider.of<EventController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        onTap: () {
          SystemNavigator.pop();
          exit(0);
        },
        title: "Upcoming Events",
        icon: Icons.arrow_back_ios,
        child: Padding(
          padding: const EdgeInsets.only(right: 18),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) {
                    return CreateEventPage();
                  },
                ),
              );
            },
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: eventController.event.length,
          itemBuilder: (context, index) {
            var allEvent = eventController.event[index];
            return PhotoCards(
              height: 300,
              vertical: 8,
              horizontal: 25,
              showBool: false,
              image: allEvent.url,
              imageTitle: allEvent.eventTitle,
              onTap: () {
                                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailedEventPage(allEvent: allEvent),
                  ),
                );
              },
              daysLeft: DateFormatter.format(allEvent.eventCreated!),
            );
          },
        ),
      ),
    );
  }
}
