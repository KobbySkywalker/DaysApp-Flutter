import 'package:days/pages/createEventPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/appBarWidget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(
        onTap: () {
          Navigator.pop(context);
        },
        title: "Days",
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        height: size.height,
        width: size.width,
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            const SizedBox(
              height: kToolbarHeight * 0.1,
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: size.height * 0.4,
              child: Container(
                child: BigPhotoView(
                  height: size.height * 0.25,
                  width: 180,
                  networkImage:
                      "https://images.unsplash.com/photo-1638913971251-832d29947de6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMTYzOTF8MXwxfGFsbHwxfHx8fHx8Mnx8MTY1NTQ3NzE2NA&ixlib=rb-1.2.1&q=80&w=1080",
                ),
              ),
            ),
            const SizedBox(
              height: kToolbarHeight * 0.1,
            ),
            SizedBox(
              width: size.width * 0.9,
              child: const Text(
                "Add your events",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: size.width * 0.9,
              child: const Text(
                "Get started by adding your special moments.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.black,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 70,
                ),
                child: Text(
                  "Create new event",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class BigPhotoView extends StatelessWidget {
  final double? height;
  final double? width;
  final String? networkImage;
  const BigPhotoView({Key? key, this.height, this.width, this.networkImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(
            networkImage!,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.only(left: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "EventList!",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "daysList!",
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
