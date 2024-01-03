import 'package:beauty_app_by_hand/Controller/Address%20Controller/get_address_controller.dart';
import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/Services/Address%20Services/fetch_address.dart';
import 'package:beauty_app_by_hand/View/Pages/Save%20Address%20&%20Phone/Components/Reusable%20Components/details_row.dart';
import 'package:beauty_app_by_hand/View/Pages/Save%20Address%20&%20Phone/Components/Widgets/add_mobile.dart';
import 'package:beauty_app_by_hand/View/Pages/Save%20Address%20&%20Phone/Components/Widgets/add_new_address.dart';
import 'package:beauty_app_by_hand/View/Pages/Summary%20Screen/summary_screen.dart';
import 'package:beauty_app_by_hand/View/Pages/Widgets/Reusable%20Components/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Widgets/Reusable Components/reusable_txt.dart';
import 'package:get/get.dart';

class SaveAddressScreen extends StatelessWidget {
  SaveAddressScreen(
      {super.key, required this.screenWidth, required this.screenHeight});
  final double screenWidth;
  final double screenHeight;
  final GetAddressController getAddressController =
      Get.put(GetAddressController());
  final GetPhoneController getPhoneController=Get.put(GetPhoneController());
  @override
  Widget build(BuildContext context) {
    fetchAddress();
    fetchPhone();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffebc1a9).withOpacity(0.5),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              FontAwesomeIcons.arrowLeft,
              size: screenWidth * 0.045,
            )),
        title: ReusableText(
            weight: FontWeight.w600,
            fontSize: screenWidth * 0.04,
            lbl: 'Address'),
      ),
      backgroundColor: themeLightColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              NewAddressComponent(
                  screenWidth: screenWidth, screenHeight: screenHeight),
              AddPhoneNumberComponent(
                  screenWidth: screenWidth, screenHeight: screenHeight),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.025),
                height: screenHeight * 0.42,
                width: screenWidth,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                decoration: BoxDecoration(
                    color: themeColor, borderRadius: BorderRadius.circular(7)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReusableText(
                        weight: FontWeight.w600,
                        fontSize: screenWidth * 0.035,
                        lbl: 'Your Details'),
                    Obx(() => DetailsRowSaveAddressScreen(
                        screenWidth: screenWidth,
                        title: 'Address Lane 1',
                        detail: getAddressController.lane1.value.toString())),
                    const Divider(
                      color: Colors.black26,
                      thickness: 0.5,
                    ),
                    Obx(() => DetailsRowSaveAddressScreen(
                        screenWidth: screenWidth,
                        title: 'Address Lane 2',
                        detail: getAddressController.lane2.value.toString())),
                    const Divider(
                      color: Colors.black26,
                      thickness: 0.5,
                    ),
                    Obx(() => DetailsRowSaveAddressScreen(
                        screenWidth: screenWidth,
                        title: 'City',
                        detail: getAddressController.city.value.toString())),
                    const Divider(
                      color: Colors.black26,
                      thickness: 0.5,
                    ),
                    Obx(() => DetailsRowSaveAddressScreen(
                        screenWidth: screenWidth,
                        title: 'County',
                        detail: getAddressController.county.value.toString())),
                    const Divider(
                      color: Colors.black26,
                      thickness: 0.5,
                    ),
                    Obx(() => DetailsRowSaveAddressScreen(
                        screenWidth: screenWidth,
                        title: 'Phone',
                        detail: getPhoneController.phone.value.toString())),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              CustomBtn(
                  btnHeight: screenHeight * 0.06,
                  btnWidth: screenWidth * 0.6,
                  onTapFunction: () {
                    Get.to(
                        SummaryScreen(
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                        transition: Transition.fadeIn);
                  },
                  txtWeight: FontWeight.w600,
                  txtFontSize: screenWidth * 0.035,
                  lbl: 'Proceed',
                  clr: themeColor,
                  txtColor: Colors.black)
            ],
          ),
        ),
      )),
    );
  }
}
