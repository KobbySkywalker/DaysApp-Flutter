import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:days/controller/eventController.dart';
import 'package:days/controller/welcomeImageController.dart';

class Providers {
  static List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider<WelcomeImageController>(
        create: (context) {
          return WelcomeImageController();
        },
      ),
      ChangeNotifierProvider<EventController>(
        create: (context) {
          return EventController();
        },
      ),
    ];
  }
}
