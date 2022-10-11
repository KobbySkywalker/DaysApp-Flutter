import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:days/controller/welcomeImageController.dart';
import 'package:days/pages/saveEvent.dart';
import 'package:days/pages/searchAllImages.dart';
import 'package:days/widgets/appBarWidget.dart';

class BackgroundPhoto extends StatelessWidget {
  const BackgroundPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var controller = Provider.of<WelcomeImageController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        onTap: () {
          Navigator.pop(context);
        },
        title: "Add background",
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
              child: const SizedBox()),
        ),
      ),
      body: Scrollbar(
        thickness: 0.1,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, top: 20, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Photo library",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "See All",
                      style: GoogleFonts.montserrat(
                          fontSize: 15, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Please allow access to your photos",
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 10, top: 10, left: 10),
                child: Text(
                  "This allows you to use photos from your library and save photos to your camera roll.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.4,
                  margin: const EdgeInsets.only(right: 10, top: 14, left: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                  child: Text(
                    "Enable Library Access",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, top: 20, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Unsplash",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SearchAllImages();
                        }));
                      },
                      child: Text(
                        "Search",
                        style: GoogleFonts.montserrat(
                            fontSize: 15, color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: double.infinity,
                height: size.height * 0.4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: controller.welcomeImage.length,
                  itemBuilder: (BuildContext context, int i) {
                    var getImage = controller.welcomeImage[i];
                    return InkWell(
                      onTap: () {
                        print(controller.eventTitle);
                        print(controller.startTime);
                        print(controller.endTime);
                        print(controller.date);
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
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
              ),
              Container(
                margin: const EdgeInsets.only(left: 12, top: 15),
                child: const Text(
                  "Colours",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                width: double.infinity,
                height: size.height * 0.1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: controller.firstColors.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      margin: const EdgeInsets.only(left: 10, right: 5),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5), // border width
                        child: Container(
                          // or ClipRRect if you need to clip the content
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                colors: [
                                  controller.firstColors[i],
                                  controller.secondColors[i],
                                ],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: const [0.0, 1.0],
                                tileMode: TileMode.clamp), // inner circle color
                          ),
                          child: Container(), // inner content
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
