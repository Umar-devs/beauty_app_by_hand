import 'package:beauty_app_by_hand/View/Pages/Widgets/Reusable%20Components/back_btn.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/constants.dart';
import '../../../Widgets/Reusable Components/reusable_txt.dart';
import '../../../Widgets/Reusable Components/top_container.dart';

class TopProfileBox extends StatelessWidget {
  const TopProfileBox(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.name});
  final double screenWidth;
  final double screenHeight;
  final String name;
  @override
  Widget build(BuildContext context) {
    return RoundPinkContainer(
        height: screenHeight * 0.25,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BackBtn(
              screenWidth: screenWidth,
            ),
            Container(
              height: screenHeight * 0.1,
              // width: screenWidth*0.3,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: themeLightColor),
              child: Center(
                child: ReusableText(
                    weight: FontWeight.bold,
                    fontSize: screenWidth * 0.12,
                    lbl:name.isNotEmpty? name.substring(0, 1).toUpperCase():'',
                clr: Colors.black,
                ),
              ),
            ),
            ReusableText(
                weight: FontWeight.w600,
                fontSize: screenWidth * 0.045,
                lbl: name)
          ],
        ));
  }
}
