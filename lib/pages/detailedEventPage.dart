import 'package:cached_network_image/cached_network_image.dart';
import 'package:days/models/eventModel.dart';
import 'package:days/pages/saveEvent.dart';
import 'package:days/utils/dateFormatter.dart';
import 'package:days/widgets/contributeBottomSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailedEventPage extends StatelessWidget {
  final EventModel? allEvent;
  const DetailedEventPage({Key? key, this.allEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              imageUrl: "${allEvent!.url}",
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.close_rounded,
                        color: Color.fromARGB(255, 93, 92, 92),
                        size: 15,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await ContributeBottomSheet().showBottomSheetModal(
                          context, allEvent!.eventTitle!, allEvent!.id!);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        CupertinoIcons.delete,
                        color: Colors.red,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    allEvent!.eventTitle!,
                    style: GoogleFonts.montserrat(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    DateFormatter.format(allEvent!.eventCreated!),
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
