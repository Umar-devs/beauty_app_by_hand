import 'package:beauty_app_by_hand/Controller/Address%20Controller/get_address_controller.dart';
import 'package:beauty_app_by_hand/Controller/Auth%20Controller/auth_controller.dart';
import 'package:beauty_app_by_hand/Controller/Profile%20controller/about_app_controller.dart';
import 'package:beauty_app_by_hand/Controller/Profile%20controller/email_controller.dart';
import 'package:beauty_app_by_hand/Controller/Profile%20controller/name_controller.dart';
import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/Services/Address%20Services/fetch_address.dart';
import 'package:beauty_app_by_hand/View/Pages/Profile%20Screen/Components/Reusable%20Components/profile_info_box.dart';
import 'package:beauty_app_by_hand/View/Pages/Profile%20Screen/Components/Widgets/edit_name_bottom_sheet.dart';
import 'package:beauty_app_by_hand/View/Pages/Profile%20Screen/Components/Widgets/edit_pass_bottom_sheet.dart';
import 'package:beauty_app_by_hand/View/Pages/Profile%20Screen/Components/Widgets/edit_phone_bottom_sheet.dart';
import 'package:beauty_app_by_hand/View/Pages/Profile%20Screen/Components/Widgets/top_profile_box.dart';
import 'package:beauty_app_by_hand/View/Pages/Save%20Address%20&%20Phone/Components/Reusable%20Components/edit_address_bottom_sheet.dart';
import 'package:beauty_app_by_hand/View/Pages/Widgets/Reusable%20Components/custom_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Services/Profile Screen Data Services/fetch_profile_data.dart';
import '../Widgets/Reusable Components/reusable_txt.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final NameController nameController = Get.put(NameController());
  final EmailController emailController = Get.put(EmailController());
  final GetPhoneController getPhoneController = Get.put(GetPhoneController());
  final AboutAppController aboutAppController = Get.put(AboutAppController());
  final AuthController authController = Get.put(AuthController());
  final User? user = FirebaseAuth.instance.currentUser;
  final lane1TextController = TextEditingController();
  final lane2TextController = TextEditingController();
  final cityTextController = TextEditingController();
  final countyTextController = TextEditingController();
  final currentPassTextController = TextEditingController();
  final newPassTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final nameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    fetchName();
    fetchEmail();
    fetchPhone();
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        height: screenHeight,
        width: screenWidth,
        color: themeLightColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Obx(() => TopProfileBox(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    name: nameController.userName.value.toUpperCase(),
                  )),
              Obx(() => ProfileInfoTile(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    titleFirstTile: nameController.userName.value.toUpperCase(),
                    prefixIconFirstTile: Icons.person_outline,
                    postfixIconFirstTile: FontAwesomeIcons.pencilAlt,
                    titleSecTile: emailController.userEmail.value.toString(),
                    prefixIconSecTile: Icons.email_outlined,
                    wantSecPostfixIcon: false,
                    postfixIconSecTile: FontAwesomeIcons.pencilAlt,
                    topPadding: screenHeight * 0.035,
                    bottomPadding: screenHeight * 0.03,
                    leftPadding: screenWidth * 0.02,
                    rightPadding: screenWidth * 0.02,
                    firstTap: () {
                      Get.bottomSheet(EditNameBottomSheetContent(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          nameController: nameTextController));
                    },
                    secTap: () {},
                  )),
              ProfileInfoTile(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                titleFirstTile: 'Address',
                prefixIconFirstTile: Icons.person_outline,
                postfixIconFirstTile: FontAwesomeIcons.pencilAlt,
                titleSecTile: 'Modify Password',
                prefixIconSecTile: Icons.password,
                wantSecPostfixIcon: true,
                postfixIconSecTile: FontAwesomeIcons.pencilAlt,
                topPadding: screenHeight * 0.0,
                bottomPadding: screenHeight * 0.0,
                leftPadding: screenWidth * 0.02,
                rightPadding: screenWidth * 0.02,
                firstTap: () {
                  Get.bottomSheet(EditAddressBottomSheetContent(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      lane1Controller: lane1TextController,
                      lane2Controller: lane2TextController,
                      cityController: cityTextController,
                      countyController: countyTextController));
                },
                secTap: () {
                  Get.bottomSheet(EditPassBottomSheetContent(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      currentPassController: currentPassTextController,
                      newPassController: newPassTextController));
                },
              ),
              Obx(() => ProfileInfoTile(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    titleFirstTile: getPhoneController.phone.value.isNotEmpty
                        ? getPhoneController.phone.value
                        : 'Nothing added yet.',
                    prefixIconFirstTile: FontAwesomeIcons.mobileAlt,
                    postfixIconFirstTile: FontAwesomeIcons.pencilAlt,
                    titleSecTile: aboutAppController.title.value,
                    prefixIconSecTile: FontAwesomeIcons.info,
                    wantSecPostfixIcon: false,
                    postfixIconSecTile: FontAwesomeIcons.pencilAlt,
                    topPadding: screenHeight * 0.03,
                    bottomPadding: screenHeight * 0.035,
                    leftPadding: screenWidth * 0.02,
                    rightPadding: screenWidth * 0.02,
                    firstTap: () {
                      Get.bottomSheet(EditPhoneBottomSheetContent(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          phoneController: phoneTextController));
                    },
                    secTap: () {
                      Get.defaultDialog(
                        title: 'Beauty Express',
                        backgroundColor: Colors.white,
                        titleStyle: GoogleFonts.headlandOne(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w700,
                        ),
                        middleText:
                            "Welcome to Beauty-Express App! Your go-to for high-quality beauty services at your doorstep. Our skilled therapists provide personalized care, making your beauty routine effortless. Join our community for an enjoyable and convenient beauty experience.",
                        middleTextStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 0.03,
                          color: Colors.black,
                        ),
                      );
                    },
                  )),
              CustomBtn(
                  btnHeight: screenHeight * 0.05,
                  btnWidth: screenWidth * 0.6,
                  onTapFunction: () {
                    authController.signOut();
                  },
                  txtWeight: FontWeight.w600,
                  txtFontSize: screenWidth * 0.037,
                  clr: themeColor,
                  lbl: 'Logout',
                  txtColor: Colors.black),
              SizedBox(
                height: screenHeight * 0.01,
              )
            ],
          ),
        ),
      ),
    );
  }
}
