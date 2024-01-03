import 'package:beauty_app_by_hand/View/Pages/Save%20Address%20&%20Phone/Components/Reusable%20Components/edit_address_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../Core/constants.dart';
import '../../../Widgets/Reusable Components/reusable_txt.dart';

class NewAddressComponent extends StatelessWidget {
  NewAddressComponent(
      {super.key, required this.screenWidth, required this.screenHeight});
  final double screenWidth;
  final double screenHeight;
  final lane1Controller = TextEditingController();
  final lane2Controller = TextEditingController();
  final cityController = TextEditingController();
  final countyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(EditAddressBottomSheetContent(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            lane1Controller: lane1Controller,
            lane2Controller: lane2Controller,
            cityController: cityController,
            countyController: countyController));
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
                Icons.location_on_outlined,
                color: Colors.black,
              ),
              ReusableText(
                  weight: FontWeight.w600,
                  fontSize: screenWidth * 0.037,
                  clr: Colors.black,
                  lbl: 'Add New Address'),
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
