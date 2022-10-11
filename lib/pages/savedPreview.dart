import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:days/controller/welcomeImageController.dart';
import 'package:days/pages/createdUpcomingEvent.dart';
import 'package:days/pages/saveEvent.dart';
import 'package:days/utils/dateFormatter.dart';
import 'package:days/utils/utils.dart';

class SavedPreview extends StatelessWidget {
  const SavedPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var welcomeController = Provider.of<WelcomeImageController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        color: Colors.amber,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: "${welcomeController.url}",
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return SizedBox(
                  height: 30,
                  width: 30,
                  child:
                      spinner(color: const Color.fromARGB(255, 93, 155, 206)),
                );
              },
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => CreatedUpcomingEvent()),
                      (route) => false);
                },
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    welcomeController.eventTitle,
                    style: GoogleFonts.montserrat(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    DateFormatter.format(welcomeController.eventCreated),
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: size.height * 0.16)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
