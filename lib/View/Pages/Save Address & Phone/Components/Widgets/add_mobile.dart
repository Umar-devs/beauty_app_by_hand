import 'package:beauty_app_by_hand/View/Pages/Profile%20Screen/Components/Widgets/edit_phone_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../Core/constants.dart';
import '../../../Widgets/Reusable Components/reusable_txt.dart';

class AddPhoneNumberComponent extends StatelessWidget {
  AddPhoneNumberComponent(
      {super.key, required this.screenWidth, required this.screenHeight});
  final double screenWidth;
  final double screenHeight;
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(EditPhoneBottomSheetContent(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            phoneController: phoneController));
      },
      child: Container(
        margin: EdgeInsets.only(top: screenHeight * 0.025),
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
        height: screenHeight * 0.11,
        width: screenWidth,
        decoration: BoxDecoration(
            color: themeColor, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.phone_android_sharp,
                color: Colors.black,
              ),
              ReusableText(
                  weight: FontWeight.w600,
                  fontSize: screenWidth * 0.037,
                  clr: Colors.black,
                  lbl: 'Add Mobile Number'),
              const Icon(
                FontAwesomeIcons.plus,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
