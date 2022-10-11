import 'dart:io';
import 'package:days/constants/constants.dart';
import 'package:days/controller/welcomeImageController.dart';
import 'package:days/pages/homePage.dart';
import 'package:days/utils/utils.dart';
import 'package:days/widgets/appBarWidget.dart';
import 'package:days/widgets/indicator.dart';
import 'package:days/widgets/photocards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var controller = Provider.of<WelcomeImageController>(context);
    return Scaffold(
      appBar: AppBarWidget(
        onTap: () {
          Navigator.pop(context);
        },
        title: Utils.dayOnly("2022-08-26 00:00:00.000"),
        icon: Icons.close,
        hideBack: true,
        child: Padding(
          padding: const EdgeInsets.only(right: 18),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) {
                    return HomePage();
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: kToolbarHeight * 0.5,
              ),
              SizedBox(
                width:
                    Platform.isAndroid ? size.width * 0.65 : size.width * 0.75,
                child: const Text(
                  'Let\'s add some events to get started',
                  style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.w500,
                      fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: size.height * 0.08),
              Container(
                height: size.height * 0.4,
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      _selectedIndex = value;
                    });
                  },
                  controller: PageController(viewportFraction: 0.8),
                  itemCount: controller.welcomeImageModel.length,
                  itemBuilder: ((context, index) {
                    var getImage = controller.welcomeImageModel[index];
                    return PhotoCards(
                      height: 0,
                      image: getImage.url!.regular,
                      imageTitle: Constants.eventTitle[index],
                      daysLeft: Constants.daysList[index],
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(controller.welcomeImageModel.length,
                      (index) {
                    return Indicator(
                      isActive: _selectedIndex == index ? true : false,
                    );
                  }),
                ],
              ),
              SizedBox(height: size.height * 0.1),
              const Text(
                'Select up to 3',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
