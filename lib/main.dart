import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:days/controller/eventController.dart';
import 'package:days/controller/welcomeImageController.dart';
import 'package:days/pages/createEventPage.dart';
import 'package:days/pages/createdUpcomingEvent.dart';
import 'package:days/pages/homePage.dart';
import 'package:days/pages/welcomePage.dart';
import 'package:days/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen $initScreen');
  runApp(MultiProvider(
    providers: Providers.providers(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    var controller =
        Provider.of<WelcomeImageController>(context, listen: false);
    var eventController = Provider.of<EventController>(context, listen: false);
    controller.getSlideScreenImages(context);
    controller.getBackgroundImages(context);
    eventController.getLoadScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var eventController = Provider.of<EventController>(context);
    print(eventController.event.length);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: initScreen == 0 ||
              eventController.event.length == 0 ||
              initScreen == null
          ? const WelcomePage()
          : initScreen! > 0 && eventController.event.length == 0
              ? HomePage()
              : CreatedUpcomingEvent(),
    );
  }
}
