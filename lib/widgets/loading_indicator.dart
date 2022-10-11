import 'package:flutter/material.dart';

class LoadingIndicator {
  BuildContext? context;
  String? text;
  LoadingIndicator(this.context, {this.text});

  void show() {
    Navigator.of(context!).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black.withOpacity(0.65),
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (context, ani1, ani2) {
          return LinearIndicator(text: text);
        },
      ),
    );
  }
}

class LinearIndicator extends StatelessWidget {
  const LinearIndicator({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LinearProgressIndicator(
                color: Colors.white,
                minHeight: 3,
                backgroundColor: Colors.blue,
              ),
              
              const SizedBox(
                height: 15,
              ),
              Text(
                text!,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
