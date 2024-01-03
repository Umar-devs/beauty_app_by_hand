import 'package:beauty_app_by_hand/Controller/Address%20Controller/get_address_controller.dart';
import 'package:beauty_app_by_hand/Controller/Appointment%20Controllers/fetch_date_controller.dart';
import 'package:beauty_app_by_hand/Controller/Payment%20Controller/payment_controller.dart';
import 'package:beauty_app_by_hand/Controller/Profile%20controller/name_controller.dart';
import 'package:beauty_app_by_hand/Controller/Treatment%20Controller/treatment_controller.dart';
import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/Core/utils.dart';
import 'package:beauty_app_by_hand/Services/Address%20Services/fetch_address.dart';
import 'package:beauty_app_by_hand/Services/Appointment%20Services/fetch_data.dart';
import 'package:beauty_app_by_hand/Services/Profile%20Screen%20Data%20Services/fetch_profile_data.dart';
import 'package:beauty_app_by_hand/Services/Treatment%20Services/fetch_data.dart';
import 'package:beauty_app_by_hand/View/Pages/Summary%20Screen/Components/Reusable%20Widgets/details_row.dart';
import 'package:beauty_app_by_hand/View/Pages/Widgets/Reusable%20Components/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Widgets/Reusable Components/reusable_txt.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen(
      {super.key, required this.screenWidth, required this.screenHeight});
  final double screenWidth;
  final double screenHeight;
  final GetAddressController getAddressController =
      Get.put(GetAddressController());
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
  final PaymentController paymentController = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    fetchAddress();
    fetchName();
    fetchPhone();
    fetchDate();
    fetchTime();
    fetchSubCategory();
    fetchCategory();
    fetchPrice();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
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
            fontSize: screenWidth * 0.045,
            lbl: 'Summary'),
      ),
      backgroundColor: themeLightColor,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: screenHeight * 0.035),
                      height: screenHeight * 0.37,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ReusableText(
                              weight: FontWeight.w600,
                              fontSize: screenWidth * 0.037,
                              lbl: 'Scheduling Details'),
                          Obx(() => DetailsRow(
                              screenWidth: screenWidth,
                              title: 'Address',
                              detail:
                                  '${getAddressController.lane1.value} ${getAddressController.lane2.value} ${getAddressController.city.value} ${getAddressController.county.value}',
                              iconData: FontAwesomeIcons.home)),
                          Divider(
                            indent: screenWidth * 0.03,
                            endIndent: screenWidth * 0.03,
                            color: Colors.black26,
                          ),
                          Obx(() => DetailsRow(
                              screenWidth: screenWidth,
                              title: 'Date',
                              detail: fetchDateController.date.value,
                              iconData: FontAwesomeIcons.calendarCheck)),
                          Divider(
                            indent: screenWidth * 0.03,
                            endIndent: screenWidth * 0.03,
                            color: Colors.black26,
                          ),
                          Obx(() => DetailsRow(
                              screenWidth: screenWidth,
                              title: 'Time Slot',
                              detail: fetchTimeController.time.value,
                              iconData: FontAwesomeIcons.clock)),
                          Divider(
                            indent: screenWidth * 0.03,
                            endIndent: screenWidth * 0.03,
                            color: Colors.black26,
                          ),
                          Obx(() => DetailsRow(
                              screenWidth: screenWidth,
                              title: 'Phone',
                              detail: getPhoneController.phone.value,
                              iconData: FontAwesomeIcons.mobileAlt)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: screenHeight * 0.02),
                      height: screenHeight * 0.35,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ReusableText(
                              weight: FontWeight.w600,
                              fontSize: screenWidth * 0.037,
                              lbl: 'Service Details'),
                          Obx(() => DetailsRowService(
                                screenWidth: screenWidth,
                                title: 'Beauty Seeker',
                                detail: nameController.userName.value,
                              )),
                          Divider(
                            indent: screenWidth * 0.03,
                            endIndent: screenWidth * 0.03,
                            color: Colors.black26,
                          ),
                          Obx(() => DetailsRowService(
                                screenWidth: screenWidth,
                                title: 'Category',
                                detail: getCategoryController.category.value,
                              )),
                          Divider(
                            indent: screenWidth * 0.03,
                            endIndent: screenWidth * 0.03,
                            color: Colors.black26,
                          ),
                          Obx(() => DetailsRowService(
                                screenWidth: screenWidth,
                                title: 'Service',
                                detail:
                                    getSubCategoryController.subCategory.value,
                              )),
                          Divider(
                            indent: screenWidth * 0.03,
                            endIndent: screenWidth * 0.03,
                            color: Colors.black26,
                          ),
                          Obx(() => DetailsRowService(
                                screenWidth: screenWidth,
                                title: 'Price',
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
                bottom: 0,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.065),
                  height: screenHeight * 0.075,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => ReusableText(
                          weight: FontWeight.w600,
                          fontSize: screenWidth * 0.037,
                          lbl: '£${getPriceController.price.value}.00')),
                      CustomBtn(
                          btnHeight: screenHeight * 0.04,
                          btnWidth: screenWidth * 0.27,
                          onTapFunction: () {
                           Utils().toastMessage('Working..');
                            paymentController.makePayment(
                                '${getPriceController.price.value}00');
                          },
                          txtWeight: FontWeight.w600,
                          txtFontSize: screenWidth * 0.035,
                          clr: Colors.white,
                          lbl: 'Pay Now',
                          txtColor: Colors.black)
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
