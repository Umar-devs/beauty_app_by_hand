import 'package:flutter/material.dart';

import '../../../Widgets/Reusable Components/reusable_txt.dart';

class DetailsRowSaveAddressScreen extends StatelessWidget {
  const DetailsRowSaveAddressScreen(
      {super.key,
      required this.screenWidth,
      required this.title,
      required this.detail});
  final double screenWidth;
  final String title;
  final String detail;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
            weight: FontWeight.w600, fontSize: screenWidth * 0.03, lbl: title),
         ReusableText(
            weight: FontWeight.w400,
            fontSize: screenWidth * 0.03,
            lbl: detail),
      ],
    );
  }
}
