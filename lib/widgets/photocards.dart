import 'package:flutter/material.dart';

class PhotoCards extends StatelessWidget {
  final String? image;
  final String? imageTitle;
  final String? daysLeft;
  final double? vertical;
  final double? horizontal;
  final double? height;
  final bool? showBool;
  const PhotoCards({
    Key? key,
    this.image,
    this.imageTitle,
    this.daysLeft,
    this.vertical = 0,
    this.horizontal = 14,
    this.height,
    this.showBool = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height!,
      margin: EdgeInsets.symmetric(horizontal: horizontal!, vertical: vertical!),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(image!),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.only(left: 20, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(right: 16, top: 16),
              child: showBool == true
                  ? Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    )
                  : const SizedBox(),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    imageTitle!,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    daysLeft!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
