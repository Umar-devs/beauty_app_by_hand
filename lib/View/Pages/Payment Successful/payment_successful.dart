import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/View/Pages/Home%20Screen/home_screen.dart';
import 'package:beauty_app_by_hand/View/Pages/Summary%20Screen/Components/Reusable%20Widgets/details_row.dart';
import 'package:beauty_app_by_hand/View/Pages/Widgets/Reusable%20Components/custom_btn.dart';
import 'package:beauty_app_by_hand/View/Pages/Widgets/Reusable%20Components/reusable_txt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Address Controller/get_address_controller.dart';
import '../../../Controller/Appointment Controllers/fetch_date_controller.dart';
import '../../../Controller/Profile controller/name_controller.dart';
import '../../../Controller/Treatment Controller/treatment_controller.dart';
import '../../../Services/Address Services/fetch_address.dart';
import '../../../Services/Appointment Services/fetch_data.dart';
import '../../../Services/Profile Screen Data Services/fetch_profile_data.dart';
import '../../../Services/Treatment Services/fetch_data.dart';

class PaymentSuccessfulScreen extends StatelessWidget {
   PaymentSuccessfulScreen({
    super.key,
  });
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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    fetchName();
    fetchPhone();
    fetchDate();
    fetchTime();
    fetchSubCategory();
    fetchCategory();
    fetchPrice();
    return SafeArea(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: screenHeight * 0.045,
                left: screenWidth * 0.045,
                right: screenWidth * 0.045),
            color: Colors.white,
            height: screenHeight,
            width: screenWidth,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.13,
                    backgroundColor: themeColor,
                    child: Icon(
                      Icons.done,
                      color: Colors.black,
                      weight: 20,
                      size: screenWidth * 0.18,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  ReusableText(
                    weight: FontWeight.w600,
                    fontSize: screenWidth * 0.05,
                    lbl: 'Payment Successful',
                  ),
                  ReusableText(
                      weight: FontWeight.w600,
                      fontSize: screenWidth * 0.035,
                      clr: Colors.grey,
                      lbl:
                          "Fantastic choice! Your beauty service is booked and confirmed. Prepare to dazzle and shine!"),
                  Container(
                    height: screenHeight * 0.51,
                    width: screenWidth,
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01,
                    ),
                    margin: EdgeInsets.only(
                      top: screenHeight * 0.03,
                    ),
                    decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ReusableText(
                            weight: FontWeight.w600,
                            fontSize: screenWidth * 0.04,
                            lbl: 'Service Details'),
                        ReusableText(
                            weight: FontWeight.w500,
                            fontSize: screenWidth * 0.025,
                            lbl: 'Chosen Glamour'),
                        Divider(
                          indent: screenWidth * 0.07,
                          endIndent: screenWidth * 0.07,
                          color: Colors.black54,
                        ),
                        Obx(() => DetailsRowPaymentSuccessful(
                          screenWidth: screenWidth,
                          title: 'Beauty Seeker',
                          detail: nameController.userName.value,
                        )),
                        Divider(
                          indent: screenWidth * 0.03,
                          endIndent: screenWidth * 0.03,
                          color: Colors.black12,
                        ),
                      Obx(() =>   DetailsRowPaymentSuccessful(
                        screenWidth: screenWidth,
                        title: 'Category',
                        detail: getCategoryController.category.value,
                      )),
                        Divider(
                          indent: screenWidth * 0.03,
                          endIndent: screenWidth * 0.03,
                          color: Colors.black12,
                        ),
                       Obx(() =>  DetailsRowPaymentSuccessful(
                         screenWidth: screenWidth,
                         title: 'Service',
                         detail: getSubCategoryController.subCategory.value,
                       )),
                        Divider(
                          indent: screenWidth * 0.03,
                          endIndent: screenWidth * 0.03,
                          color: Colors.black12,
                        ),
                      Obx(() =>   DetailsRowPaymentSuccessful(
                        screenWidth: screenWidth,
                        title: 'Date',
                        detail: fetchDateController.date.value,
                      )),
                        Divider(
                          indent: screenWidth * 0.03,
                          endIndent: screenWidth * 0.03,
                          color: Colors.black12,
                        ),
                        Obx(() => DetailsRowPaymentSuccessful(
                          screenWidth: screenWidth,
                          title: 'Time Slot',
                          detail: fetchTimeController.time.value,
                        )),
                        Divider(
                          indent: screenWidth * 0.03,
                          endIndent: screenWidth * 0.03,
                          color: Colors.black12,
                        ),
                       Obx(() =>  DetailsRowPaymentSuccessful(
                         screenWidth: screenWidth,
                         title: 'Phone',
                         detail:getPhoneController.phone.value,
                       )),
                        Divider(
                          indent: screenWidth * 0.07,
                          endIndent: screenWidth * 0.07,
                          color: Colors.black54,
                        ),
                       Obx(() =>  DetailsRowService(
                         screenWidth: screenWidth,
                         title: 'Subtotal',
                         detail: '£${getPriceController.price.value}.00',
                       )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.032,
            left: screenWidth * 0.25,
            child: CustomBtn(
                btnHeight: screenHeight * 0.05,
                btnWidth: screenWidth * 0.5,
                onTapFunction: () {
                  Get.offAll(HomeScreen(), transition: Transition.fadeIn);
                },
                txtWeight: FontWeight.w600,
                txtFontSize: screenWidth * 0.035,
                lbl: 'Home',
                clr: themeColor,
                txtColor: Colors.black),
          ),
        ],
      ),
    );
  }
}
