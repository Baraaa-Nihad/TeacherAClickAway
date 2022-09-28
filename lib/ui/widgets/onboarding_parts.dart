import 'package:eschool_teacher/utils/api.dart';
import 'package:eschool_teacher/utils/constants.dart';
import 'package:flutter/material.dart';

class OnBoardingParts extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  OnBoardingParts(
      {required this.title, required this.subtitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: const EdgeInsets.only(bottom: 30),
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                "assets/images/$image",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 12,
              width: 15,
            ),
            FittedBox(
              child: Text(
                "$title",
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 12,
              width: 15,
            ),
            Expanded(
              child: Text(
                subtitle,
                maxLines: 8,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    // fontSize: 20,
                    ),
              ),
            ),
          ],
        ));
  }
}


class OnBoardingPartsAll extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? image;

  OnBoardingPartsAll(
      {required this.title, required this.subtitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(bottom: 30),
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                "${baseUrl}/storage/app/public/${image}",
                fit: BoxFit.contain,
                errorBuilder: (BuildContext context,
                    Object error,
                    StackTrace? stackTrace) {
                  return Image.asset("assets/images/logo.png");
                }
              ),
            ),
            SizedBox(
              height: 12,
              width: 15,
            ),
            FittedBox(
              child: Text(
                "$title",
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 12,
              width: 15,
            ),
            Expanded(
              child: Text(
                "${subtitle}",
                maxLines: 8,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  // fontSize: 20,
                ),
              ),
            ),
          ],
        ));
  }
}
