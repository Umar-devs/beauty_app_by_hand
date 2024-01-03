import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/Reusable Components/reusable_txt.dart';

class CalendarTitleRow extends StatelessWidget {
  const CalendarTitleRow(
      {super.key, required this.label, required this.currentMonth});
  final String label;
  final String currentMonth;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
      color: themeLightColor,
      height: screenHeight * 0.05,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              weight: FontWeight.w600,
              fontSize: screenWidth * 0.035,
              lbl: label,
              clr: Colors.black,
            ),
            ReusableText(
              weight: FontWeight.w600,
              fontSize: screenWidth * 0.035,
              lbl: "<$currentMonth>",
              clr: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
