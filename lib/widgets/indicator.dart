import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool? isActive;
  const Indicator({
    Key? key,
    this.isActive
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      margin: const EdgeInsets.only(right: 4),
      width: 8,
      decoration: BoxDecoration(
        color: isActive! ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
