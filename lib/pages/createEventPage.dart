import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:days/controller/welcomeImageController.dart';
import 'package:days/pages/addDatepage.dart';
import 'package:days/widgets/appBarWidget.dart';
import 'package:flutter/material.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({Key? key}) : super(key: key);

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  final maxLength = 25;
  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var welcomeController = Provider.of<WelcomeImageController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        onTap: () {
          Navigator.pop(context);
        },
        title: "Add event",
        icon: Icons.close,
        child: Padding(
          padding: const EdgeInsets.only(right: 18),
          child: InkWell(
            onTap: () {
              if (controller.text.isEmpty) {
                showDialog(
                  context: context,
                  builder: (ctx) => CupertinoAlertDialog(
                    title: const Text("Fill Event Input"),
                    content: const Text(
                        "Event Input cannot be empty, Try entering something"),
                    actions: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                );
                return;
              }
              welcomeController.setEventTitle(controller.text);
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) {
                    return const AddDatePage();
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
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 11),
                  child: Text(
                    "${controller.text.length}/$maxLength",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                TextFormField(
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  maxLength: maxLength,
                  controller: controller,
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      counterStyle: TextStyle(fontSize: 0, height: 0),
                      fillColor: Colors.white,
                      filled: true,
                      border: InputBorder.none,
                      hintText: "Add Title",
                      hintStyle: TextStyle(fontSize: 22, color: Colors.grey)),
                  cursorColor: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
