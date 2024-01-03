import 'package:beauty_app_by_hand/Services/Profile%20Screen%20Data%20Services/save_profile_data.dart';
import 'package:beauty_app_by_hand/Services/Treatment%20Services/save_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Core/constants.dart';
import '../../../Widgets/Reusable Components/custom_btn.dart';
import '../../../Widgets/Reusable Components/reusable_txt.dart';
import '../../../Widgets/Reusable Components/txt_field.dart';

class EditNameBottomSheetContent extends StatelessWidget {
  const EditNameBottomSheetContent(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.nameController});
  final double screenWidth;
  final double screenHeight;
  final TextEditingController nameController;
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
                lbl: 'Edit Name'),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            TxtField(
                label: 'Type New Name',
                fieldIcon: const Icon(Icons.person_outline),
                keyboardType: TextInputType.name,
                textEditingController: nameController,
                errorMessage: 'Empty Field'),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            CustomBtn(
                btnHeight: screenHeight * 0.06,
                btnWidth: screenWidth * 0.55,
                onTapFunction: () {
                  saveName(nameController.text);
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
