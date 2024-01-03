import 'package:beauty_app_by_hand/Services/Update%20Password/update_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Core/constants.dart';
import '../../../Widgets/Reusable Components/custom_btn.dart';
import '../../../Widgets/Reusable Components/reusable_txt.dart';
import '../../../Widgets/Reusable Components/txt_field.dart';

class EditPassBottomSheetContent extends StatelessWidget {
  const EditPassBottomSheetContent(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.currentPassController,
      required this.newPassController});
  final double screenWidth;
  final double screenHeight;
  final TextEditingController currentPassController;
  final TextEditingController newPassController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.4,
      width: screenWidth,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      decoration: BoxDecoration(
          color: themeLightColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: screenHeight * 0.045,
                width: screenWidth * 0.15,
                color: themeColor,
                child: const Center(
                  child: Icon(Icons.cancel_outlined),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            ReusableText(
                weight: FontWeight.w600,
                fontSize: screenWidth * 0.037,
                lbl: 'Edit Password'),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            TxtField(
                label: 'Type Current Password',
                fieldIcon: const Icon(Icons.password),
                textEditingController: currentPassController,
                errorMessage: 'Empty Field'),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            TxtField(
                label: 'Type New Password',
                fieldIcon: const Icon(Icons.password),
                textEditingController: newPassController,
                errorMessage: 'Empty Field'),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            CustomBtn(
                btnHeight: screenHeight * 0.06,
                btnWidth: screenWidth * 0.6,
                onTapFunction: () {
                  changePassword(
                          currentPassController.text, newPassController.text)
                      .then((value) => Get.back());
                },
                txtWeight: FontWeight.w600,
                txtFontSize: screenWidth * 0.035,
                clr: themeColor,
                lbl: 'Save Password',
                txtColor: Colors.black)
          ],
        ),
      ),
    );
  }
}
