import 'package:flutter/material.dart';
import 'package:days/models/welcomeImagesModel.dart';
import 'package:days/services/welcomeImageServices.dart';
import 'package:flutter/cupertino.dart';

class WelcomeImageController extends ChangeNotifier with WelcomeImageServices {
  List<WeclomeImagesModel> _welcomeImageModel = [];

  List<WeclomeImagesModel> get welcomeImageModel {
    return _welcomeImageModel;
  }

  List<WeclomeImagesModel> _welcomeImage = [];

  List<WeclomeImagesModel> get welcomeImage {
    return _welcomeImage;
  }

  void getSlideScreenImages(BuildContext context) async {
    var response = await getSplashImages(context);
    _welcomeImageModel = response;
    notifyListeners();
  }

  void getBackgroundImages(BuildContext context) async {
    var response = await loadBackgroundImages(context);
    _welcomeImage = response;
    notifyListeners();
  }

  List<Color> firstColors = [
    const Color(0xffb76f90),
    const Color(0xfff1c37d),
    const Color(0xff4a87a8),
    const Color(0xff7c3e75),
    const Color(0xffd1d1ed),
    const Color(0xffa02388)
  ];
  List<Color> secondColors = [
    const Color(0xff866aa9),
    const Color(0xfff0ba80),
    const Color(0xff374c87),
    const Color(0xffab4462),
    const Color(0xffbfaaf1),
    const Color(0xff681985)
  ];

  late String _eventTitle;
  late String _date;
  late String _startTime;
  late String _endTime;
  late String _url;
  late String _eventCreated;

  void setEventTitle(String eventTitle) {
    _eventTitle = eventTitle;
    notifyListeners();
  }

  void setEventDateCreated(String eventCreated) {
    _eventCreated = eventCreated;
    notifyListeners();
  }

  void setDate(String date) {
    _date = date;
    notifyListeners();
  }

  void setStartTime(String startTime) {
    _startTime = startTime;
    notifyListeners();
  }

  void setEndTime(String endTime) {
    _endTime = endTime;
    notifyListeners();
  }

  void setImageUrl(String url) {
    _url = url;
    notifyListeners();
  }

  String get eventTitle => _eventTitle;
  String get date => _date;
  String get startTime => _startTime;
  String get endTime => _endTime;
  String get url => _url;
  String get eventCreated => _eventCreated;
}
