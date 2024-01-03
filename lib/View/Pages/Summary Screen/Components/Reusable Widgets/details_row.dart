import 'package:flutter/material.dart';
import '../../../Widgets/Reusable Components/reusable_txt.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow(
      {super.key,
      required this.screenWidth,
      required this.title,
      required this.detail,
      required this.iconData});
  final double screenWidth;
  final String title;
  final String detail;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableText(
                  weight: FontWeight.w600,
                  fontSize: screenWidth * 0.035,
                  alignTxt: TextAlign.left,
                  lbl: title),
              ReusableText(
                  weight: FontWeight.w400,
                  fontSize: screenWidth * 0.03,
                  alignTxt: TextAlign.left,
                  clr: Colors.black87,
                  lbl: detail),
            ],
          ),
          Icon(
            iconData,
            size: screenWidth * 0.04,
          ),
        ],
      ),
    );
  }
}

class DetailsRowService extends StatelessWidget {
  final double screenWidth;
  final String title;
  final String detail;

  const DetailsRowService({
    super.key,
    required this.screenWidth,
    required this.title,
    required this.detail,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ReusableText(
              weight: FontWeight.w600,
              fontSize: screenWidth * 0.035,
              alignTxt: TextAlign.left,
              lbl: title),
          ReusableText(
              weight: FontWeight.w400,
              fontSize: screenWidth * 0.03,
              alignTxt: TextAlign.left,
              clr: Colors.black87,
              lbl: detail),
        ],
      ),
    );
  }
}

class DetailsRowPaymentSuccessful extends StatelessWidget {
  final double screenWidth;
  final String title;
  final String detail;

  const DetailsRowPaymentSuccessful({
    super.key,
    required this.screenWidth,
    required this.title,
    required this.detail,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ReusableText(
              weight: FontWeight.w400,
              fontSize: screenWidth * 0.03,
              alignTxt: TextAlign.left,
              clr: Colors.black87,
              lbl: title),
          ReusableText(
              weight: FontWeight.w600,
              fontSize: screenWidth * 0.035,
              alignTxt: TextAlign.left,
              lbl: detail),
        ],
      ),
    );
  }
}
