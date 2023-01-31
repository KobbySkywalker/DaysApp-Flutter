import 'package:days/controller/eventController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContributeBottomSheet {
  Future<String?> showBottomSheetModal(
    BuildContext context,
    String title,
    String id,
  ) async {
    return await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
        ),
        backgroundColor: Colors.white,
        clipBehavior: Clip.hardEdge,
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        builder: (context) {
          return InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Wrap(
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: 4,
                      width: 50,
                      color: Colors.grey[200],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          "Are you sure you want to delete $title?",
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "This action cannot be undone.",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 20),
                        MaterialButton(
                          onPressed: () {
                            Provider.of<EventController>(context, listen: false)
                                .deleteSingleEvent(context, id);
                          },
                          color: Colors.black,
                          elevation: 0,
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              "Delete Event",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(width: 1, color: Colors.black),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              "Cancel",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
