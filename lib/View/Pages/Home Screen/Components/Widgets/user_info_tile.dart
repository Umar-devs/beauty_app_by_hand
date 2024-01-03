import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/View/Pages/Profile%20Screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widgets/Reusable Components/reusable_txt.dart';

class UserInfoTile extends StatelessWidget {
  const UserInfoTile(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.displayLetter,
      required this.title});
  final double screenWidth;
  final double screenHeight;
  final String displayLetter;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.12,
      width: screenWidth,
      margin: const EdgeInsets.only(bottom: 25, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/B_logo.png',
            width: screenWidth * 0.25,
            height: double.infinity,
          ),
          Row(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: ReusableText(
                      weight: FontWeight.w600,
                      fontSize: screenWidth * 0.033,
                      lbl: title)),
              SizedBox(
                width: screenWidth * 0.025,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Get.to(ProfileScreen(), transition: Transition.rightToLeft);
                  },
                  child: CircleAvatar(
                    backgroundColor: themeColor,
                    radius: screenWidth * 0.06,
                    child: Center(
                        child: ReusableText(
                            weight: FontWeight.w700,
                            fontSize: screenWidth * 0.05,
                            lbl: displayLetter)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
