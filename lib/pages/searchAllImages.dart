import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:days/controller/welcomeImageController.dart';
import 'package:days/pages/saveEvent.dart';
import 'package:days/widgets/appBarWidget.dart';

class SearchAllImages extends StatelessWidget {
  const SearchAllImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<WelcomeImageController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        onTap: () {
          Navigator.pop(context);
        },
        title: "Search Images",
        icon: Icons.arrow_back_ios,
        child: Padding(
          padding: const EdgeInsets.only(right: 18),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) {
                    return const Text("Data");
                  },
                ),
              );
            },
            child: const SizedBox(),
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: controller.welcomeImage.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                (MediaQuery.of(context).orientation == Orientation.portrait)
                    ? 3
                    : 4),
        itemBuilder: (BuildContext context, int i) {
          var getImage = controller.welcomeImage[i];
          return InkWell(
            onTap: () {
              print(controller.eventTitle);
              print(controller.startTime);
              print(controller.endTime);
              print(controller.date);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SaveEvent(
                  url: getImage.url!.regular!,
                );
              }));
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: 160,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  getImage.url!.regular!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
