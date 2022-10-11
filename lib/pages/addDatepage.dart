import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:days/controller/welcomeImageController.dart';
import 'package:days/pages/backgroundPhoto.dart';
import 'package:days/utils/utils.dart';
import 'package:days/widgets/appBarWidget.dart';

class AddDatePage extends StatefulWidget {
  const AddDatePage({Key? key}) : super(key: key);

  @override
  State<AddDatePage> createState() => _AddDatePageState();
}

class _AddDatePageState extends State<AddDatePage> {
  DateTime date = DateTime.now();
  bool value = false;
  String? startTime;
  String? endTime;
  String? timeElse;
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();
  TimeOfDay selectedElseTime = TimeOfDay.now();

  _selectStartTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedStartTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedStartTime) {
      setState(() {
        selectedStartTime = timeOfDay;
      });
    }
  }

  _selectEndTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedEndTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedEndTime) {
      setState(() {
        selectedEndTime = timeOfDay;
      });
    }
  }

  _selectElseTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedElseTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedElseTime) {
      setState(() {
        selectedElseTime = timeOfDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color activeColor = Color.fromARGB(255, 26, 27, 26);
    var welcomeController = Provider.of<WelcomeImageController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        onTap: () {
          Navigator.pop(context);
        },
        title: "Add event",
        icon: Icons.arrow_back_ios,
        child: Padding(
          padding: const EdgeInsets.only(right: 18),
          child: InkWell(
            onTap: () {
              //print(Utils.getDateWithoutTime(date.toString()));
              if (value == true) {
                welcomeController.setStartTime(
                    "${selectedElseTime.hour}:${selectedElseTime.minute}");
                welcomeController.setEndTime(
                    "${selectedElseTime.hour}:${selectedElseTime.minute}");
              } else {
                welcomeController.setStartTime(
                    "${selectedStartTime.hour}:${selectedStartTime.minute}");
                welcomeController.setEndTime(
                    "${selectedEndTime.hour}:${selectedEndTime.minute}");
              }
              welcomeController.setDate(date.toString());
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) {
                    return const BackgroundPhoto();
                  },
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 12, right: 12, top: 18),
              child: Text(
                "Next",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 24, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date",
                      style: GoogleFonts.montserrat(
                          fontSize: 15, color: Colors.grey[500]),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      Utils.getDateWithoutTime(date.toString()),
                      style: GoogleFonts.raleway(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 110,
                padding: const EdgeInsets.all(10),
                child: CupertinoDatePicker(
                  initialDateTime: date,
                  mode: CupertinoDatePickerMode.date,
                  use24hFormat: true,
                  // This is called when the user changes the date.
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() => date = newDate);
                  },
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "All Day",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 20),
                    child: ShaderMask(
                      shaderCallback: (r) {
                        return LinearGradient(
                          colors: value
                              ? [Colors.white, Colors.white]
                              : [
                                  Colors.white,
                                  const Color.fromARGB(255, 255, 255, 255)
                                ],
                        ).createShader(r);
                      },
                      child: CupertinoSwitch(
                        activeColor: activeColor,
                        value: value,
                        onChanged: (v) => setState(() => value = v),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              !value == true
                  ? Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Start Time",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                              TimeUnit(
                                timeValue:
                                    "${selectedStartTime.hour}:${selectedStartTime.minute}",
                                onTap: () => _selectStartTime(context),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "End Time",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                              TimeUnit(
                                timeValue:
                                    "${selectedEndTime.hour}:${selectedEndTime.minute}",
                                onTap: () => _selectEndTime(context),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Use Same Time",
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 15),
                          ),
                          TimeUnit(
                            timeValue:
                                "${selectedElseTime.hour}:${selectedElseTime.minute}",
                            onTap: () => _selectElseTime(context),
                          ),
                        ],
                      ),
                    ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Repeat",
                      style: TextStyle(color: Colors.grey[400], fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            "Does not repeat",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0, top: 4),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey[400],
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event Format",
                      style: TextStyle(color: Colors.grey[400], fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            "Default",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(right: 10.0, top: 4),
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.black),
                            child: const Text(
                              " Pro ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeUnit extends StatelessWidget {
  final String? timeValue;
  final VoidCallback? onTap;
  const TimeUnit({Key? key, this.timeValue, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          timeValue!,
          style: const TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}
