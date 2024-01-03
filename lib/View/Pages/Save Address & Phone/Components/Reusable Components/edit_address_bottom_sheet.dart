import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Core/constants.dart';
import '../../../../../Services/Address Services/save_address.dart';
import '../../../Widgets/Reusable Components/custom_btn.dart';
import '../../../Widgets/Reusable Components/reusable_txt.dart';
import '../../../Widgets/Reusable Components/txt_field.dart';

class EditAddressBottomSheetContent extends StatelessWidget {
  const EditAddressBottomSheetContent(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.lane1Controller,
      required this.lane2Controller,
      required this.cityController,
      required this.countyController});
  final double screenWidth;
  final double screenHeight;
  final TextEditingController lane1Controller;
  final TextEditingController lane2Controller;
  final TextEditingController cityController;
  final TextEditingController countyController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.75,
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
                lbl: 'Edit Address'),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            TxtField(
                label: 'Address Lane 1',
                fieldIcon: const Icon(Icons.add_location_rounded),
                textEditingController: lane1Controller,
                errorMessage: 'Empty Field'),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            TxtField(
                label: 'Address Lane 2',
                fieldIcon: const Icon(Icons.add_location_rounded),
                textEditingController: lane2Controller,
                errorMessage: 'Empty Field'),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            TxtField(
                label: 'City',
                fieldIcon: const Icon(Icons.location_city),
                textEditingController: cityController,
                errorMessage: 'Empty Field'),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            TxtField(
                label: 'County',
                fieldIcon: const Icon(Icons.my_location_rounded),
                textEditingController: countyController,
                errorMessage: 'Empty Field'),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            CustomBtn(
                btnHeight: screenHeight * 0.06,
                btnWidth: screenWidth * 0.6,
                onTapFunction: () {
                  saveAddress(lane1Controller.text, lane2Controller.text,
                      cityController.text, countyController.text);
                  Get.back();
                },
                txtWeight: FontWeight.w600,
                txtFontSize: screenWidth * 0.035,
                clr: themeColor,
                lbl: 'Save Address',
                txtColor: Colors.black)
          ],
        ),
      ),
    );
  }
}
