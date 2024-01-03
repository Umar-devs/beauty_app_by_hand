import 'package:flutter/material.dart';

import '../../../Widgets/Reusable Components/reusable_txt.dart';

class TimeTitle extends StatelessWidget {
  const TimeTitle(
      {super.key,
      required this.screenWidth,
      required this.title,
      required this.topPadding,
      required this.bottomPadding});
  final double screenWidth;
  final String title;
  final double topPadding;
  final double bottomPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 0.025, top: topPadding, bottom: bottomPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ReusableText(
            weight: FontWeight.w600, fontSize: screenWidth * 0.037, lbl: title),
      ),
    );
  }
}
