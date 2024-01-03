import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Core/constants.dart';
import '../../../../../Services/Address Services/save_address.dart';
import '../../../Widgets/Reusable Components/custom_btn.dart';
import '../../../Widgets/Reusable Components/reusable_txt.dart';
import '../../../Widgets/Reusable Components/txt_field.dart';

class EditPhoneBottomSheetContent extends StatelessWidget {
  const EditPhoneBottomSheetContent(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.phoneController});
  final double screenWidth;
  final double screenHeight;
  final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.33,
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
                lbl: 'Include a Phone Number'),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            TxtField(
                label: 'Type Number',
                fieldIcon: const Icon(Icons.phone_android_sharp),
                keyboardType: TextInputType.phone,
                textEditingController: phoneController,
                errorMessage: 'Empty Field'),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            CustomBtn(
                btnHeight: screenHeight * 0.06,
                btnWidth: screenWidth * 0.55,
                onTapFunction: () {
                  savePhone(phoneController.text);
                },
                txtWeight: FontWeight.w600,
                txtFontSize: screenWidth * 0.035,
                clr: themeColor,
                lbl: 'Save',
                txtColor: Colors.black)
          ],
        ),
      ),
    );
  }
}
