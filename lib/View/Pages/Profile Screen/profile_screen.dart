import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/Services/Address%20Services/fetch_address.dart';
import 'package:beauty_app_by_hand/View/Pages/Profile%20Screen/Components/Reusable%20Components/profile_info_box.dart';
import 'package:beauty_app_by_hand/View/Pages/Profile%20Screen/Components/Widgets/edit_name_bottom_sheet.dart';
import 'package:beauty_app_by_hand/View/Pages/Profile%20Screen/Components/Widgets/edit_pass_bottom_sheet.dart';
import 'package:beauty_app_by_hand/View/Pages/Profile%20Screen/Components/Widgets/edit_phone_bottom_sheet.dart';
import 'package:beauty_app_by_hand/View/Pages/Profile%20Screen/Components/Widgets/top_profile_box.dart';
import 'package:beauty_app_by_hand/View/Pages/Profile%20Screen/profile_data.dart';
import 'package:beauty_app_by_hand/View/Pages/Save%20Address%20&%20Phone/Components/Reusable%20Components/edit_address_bottom_sheet.dart';
import 'package:beauty_app_by_hand/View/Pages/Widgets/Reusable%20Components/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Services/Profile Screen Data Services/fetch_profile_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    fetchName();
    fetchEmail();
    fetchPhone();
    final double height = screenHeight(context);
    final double width = screenWidth(context);
    return SafeArea(
      child: Container(
        height: height,
        width: width,
        color: themeLightColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Obx(() => TopProfileBox(
                    screenWidth: width,
                    screenHeight: height,
                    name: nameController.userName.value.toUpperCase(),
                  )),
              Obx(() => ProfileInfoTile(
                    screenWidth: width,
                    screenHeight: height,
                    titleFirstTile: nameController.userName.value.toUpperCase(),
                    prefixIconFirstTile: Icons.person_outline,
                    postfixIconFirstTile: FontAwesomeIcons.pencilAlt,
                    titleSecTile: emailController.userEmail.value.toString(),
                    prefixIconSecTile: Icons.email_outlined,
                    wantSecPostfixIcon: false,
                    postfixIconSecTile: FontAwesomeIcons.pencilAlt,
                    topPadding: height * 0.035,
                    bottomPadding: height * 0.03,
                    leftPadding: width * 0.02,
                    rightPadding: width * 0.02,
                    firstTap: () {
                      Get.bottomSheet(EditNameBottomSheetContent(
                          screenWidth: width,
                          screenHeight: height,
                          nameController: nameTextController));
                    },
                    secTap: () {},
                  )),
              ProfileInfoTile(
                screenWidth: width,
                screenHeight: height,
                titleFirstTile: 'Address',
                prefixIconFirstTile: Icons.person_outline,
                postfixIconFirstTile: FontAwesomeIcons.pencilAlt,
                titleSecTile: 'Modify Password',
                prefixIconSecTile: Icons.password,
                wantSecPostfixIcon: true,
                postfixIconSecTile: FontAwesomeIcons.pencilAlt,
                topPadding: height * 0.0,
                bottomPadding: height * 0.0,
                leftPadding: width * 0.02,
                rightPadding: width * 0.02,
                firstTap: () {
                  Get.bottomSheet(EditAddressBottomSheetContent(
                      screenWidth: width,
                      screenHeight: height,
                      lane1Controller: lane1TextController,
                      lane2Controller: lane2TextController,
                      cityController: cityTextController,
                      countyController: countyTextController));
                },
                secTap: () {
                  Get.bottomSheet(EditPassBottomSheetContent(
                      screenWidth: width,
                      screenHeight: height,
                      currentPassController: currentPassTextController,
                      newPassController: newPassTextController));
                },
              ),
              Obx(() => ProfileInfoTile(
                    screenWidth: width,
                    screenHeight: height,
                    titleFirstTile: getPhoneController.phone.value.isNotEmpty
                        ? getPhoneController.phone.value
                        : 'Nothing added yet.',
                    prefixIconFirstTile: FontAwesomeIcons.mobileAlt,
                    postfixIconFirstTile: FontAwesomeIcons.pencilAlt,
                    titleSecTile: aboutAppController.title.value,
                    prefixIconSecTile: FontAwesomeIcons.info,
                    wantSecPostfixIcon: false,
                    postfixIconSecTile: FontAwesomeIcons.pencilAlt,
                    topPadding: height * 0.03,
                    bottomPadding: height * 0.035,
                    leftPadding: width * 0.02,
                    rightPadding: width * 0.02,
                    firstTap: () {
                      Get.bottomSheet(EditPhoneBottomSheetContent(
                          screenWidth: width,
                          screenHeight: height,
                          phoneController: phoneTextController));
                    },
                    secTap: () {
                      Get.defaultDialog(
                        title: 'Beauty Express',
                        backgroundColor: Colors.white,
                        titleStyle: GoogleFonts.headlandOne(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w700,
                        ),
                        middleText:
                            "Welcome to Beauty-Express App! Your go-to for high-quality beauty services at your doorstep. Our skilled therapists provide personalized care, making your beauty routine effortless. Join our community for an enjoyable and convenient beauty experience.",
                        middleTextStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: width * 0.03,
                          color: Colors.black,
                        ),
                      );
                    },
                  )),
              CustomBtn(
                  btnHeight: height * 0.05,
                  btnWidth: width * 0.6,
                  onTapFunction: () {
                    authController.signOut();
                  },
                  txtWeight: FontWeight.w600,
                  txtFontSize: width * 0.037,
                  clr: themeColor,
                  lbl: 'Logout',
                  txtColor: Colors.black),
              SizedBox(
                height: height * 0.01,
              )
            ],
          ),
        ),
      ),
    );
  }
}
