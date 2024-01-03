import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/View/Pages/Home%20Screen/home_screen.dart';
import 'package:beauty_app_by_hand/View/Pages/Payment%20Successful/Components/functions_call.dart';
import 'package:beauty_app_by_hand/View/Pages/Widgets/Reusable%20Components/custom_btn.dart';
import 'package:beauty_app_by_hand/View/Pages/Widgets/Reusable%20Components/reusable_txt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/Address Controller/get_address_controller.dart';
import '../../../Controller/Appointment Controllers/fetch_date_controller.dart';
import '../../../Controller/Profile controller/name_controller.dart';
import '../../../Controller/Treatment Controller/treatment_controller.dart';
import 'Components/Reusable Components/content_divider.dart';
import 'Components/Reusable Components/dark_color_divider.dart';
import 'Components/Widgets/details_showing_container.dart';
import 'Components/Widgets/top_circle.dart';

class PaymentSuccessfulScreen extends StatelessWidget {
  PaymentSuccessfulScreen({
    super.key,
  });
  //All Get Controllers
  final GetPhoneController getPhoneController = Get.put(GetPhoneController());
  final NameController nameController = Get.put(NameController());
  final FetchDateController fetchDateController =
      Get.put(FetchDateController());
  final FetchTimeController fetchTimeController =
      Get.put(FetchTimeController());
  final GetCategoryController getCategoryController =
      Get.put(GetCategoryController());
  final GetSubCategoryController getSubCategoryController =
      Get.put(GetSubCategoryController());
  final GetPriceController getPriceController = Get.put(GetPriceController());
  @override
  Widget build(BuildContext context) {
    // getting screen height and width
    final width = screenWidth(context);
    final height = screenHeight(context);

    // making instance of class ContentDivider and assign it to a variable contentDivider
    final ContentDivider contentDivider =
        ContentDivider(screenWidth: screenWidth(context));
    // making instance of class DarkMarginDivider and assign it to a variable darkMarginDivider
    final DarkMarginDivider darkMarginDivider =
        DarkMarginDivider(screenWidth: screenWidth(context));

    //calling a function callRequiredFunctions() which calls all the required functions, this is to improve readability
    callRequiredFunctions();
    return SafeArea(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: height * 0.045, left: width * 0.045, right: width * 0.045),
            color: Colors.white,
            height: height,
            width: width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  TopTickCircle(
                    width: width,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  ReusableText(
                    weight: FontWeight.w600,
                    fontSize: width * 0.05,
                    lbl: 'Payment Successful',
                  ),
                  ReusableText(
                      weight: FontWeight.w600,
                      fontSize: width * 0.035,
                      clr: Colors.grey,
                      lbl:
                          "Fantastic choice! Your beauty service is booked and confirmed. Prepare to dazzle and shine!"),
                //Container Showing all details in screen
                  detailsShowingContainer(
                    height,
                    width,
                    darkMarginDivider,
                    contentDivider,
                    nameController,
                    getCategoryController,
                    getSubCategoryController,
                    fetchDateController,
                    fetchTimeController,
                    getPhoneController,
                    getPriceController,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.032,
            left: width * 0.25,
            child: CustomBtn(
                btnHeight: height * 0.05,
                btnWidth: width * 0.5,
                onTapFunction: () {
                  Get.offAll(HomeScreen(), transition: Transition.fadeIn);
                },
                txtWeight: FontWeight.w600,
                txtFontSize: width * 0.035,
                lbl: 'Home',
                clr: themeColor,
                txtColor: Colors.black),
          ),
        ],
      ),
    );
  }
}
