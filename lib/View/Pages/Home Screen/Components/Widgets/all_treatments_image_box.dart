import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Data/lists.dart';

class TreatmentsImgBox extends StatelessWidget {
  const TreatmentsImgBox(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.i});
  final double screenWidth;
  final double screenHeight;
  final int i;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 10, left: screenWidth * 0.025, right: screenWidth * 0.025),
      height: screenHeight * 0.08,
      width: screenWidth,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(croppedImagesHomeScreen[i]),
              fit: BoxFit.cover)),
      child: Center(
        child: Text(
          treatmentsNames[i],
          style: GoogleFonts.abrilFatface(
            fontSize: screenWidth * 0.055,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
