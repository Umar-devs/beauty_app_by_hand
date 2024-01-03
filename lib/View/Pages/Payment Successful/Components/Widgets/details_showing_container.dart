import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../Core/constants.dart';
import '../../../Summary Screen/Components/Reusable Widgets/details_row.dart';
import '../../../Widgets/Reusable Components/reusable_txt.dart';

Widget detailsShowingContainer(
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
) {
  return Container(
    height: height * 0.51,
    width: width,
    padding: EdgeInsets.symmetric(
      vertical: height * 0.01,
    ),
    margin: EdgeInsets.only(
      top: height * 0.03,
    ),
    decoration: BoxDecoration(
        color: themeColor, borderRadius: BorderRadius.circular(7)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ReusableText(
            weight: FontWeight.w600,
            fontSize: width * 0.04,
            lbl: 'Service Details'),
        ReusableText(
            weight: FontWeight.w500,
            fontSize: width * 0.025,
            lbl: 'Chosen Glamour'),
        darkMarginDivider,
        Obx(() => DetailsRowPaymentSuccessful(
              screenWidth: width,
              title: 'Beauty Seeker',
              detail: nameController.userName.value,
            )),
        contentDivider,
        Obx(() => DetailsRowPaymentSuccessful(
              screenWidth: width,
              title: 'Category',
              detail: getCategoryController.category.value,
            )),
        contentDivider,
        Obx(() => DetailsRowPaymentSuccessful(
              screenWidth: width,
              title: 'Service',
              detail: getSubCategoryController.subCategory.value,
            )),
        contentDivider,
        Obx(() => DetailsRowPaymentSuccessful(
              screenWidth: width,
              title: 'Date',
              detail: fetchDateController.date.value,
            )),
        contentDivider,
        Obx(() => DetailsRowPaymentSuccessful(
              screenWidth: width,
              title: 'Time Slot',
              detail: fetchTimeController.time.value,
            )),
        contentDivider,
        Obx(() => DetailsRowPaymentSuccessful(
              screenWidth: width,
              title: 'Phone',
              detail: getPhoneController.phone.value,
            )),
        darkMarginDivider,
        Obx(() => DetailsRowService(
              screenWidth: width,
              title: 'Subtotal',
              detail: '£${getPriceController.price.value}.00',
            )),
      ],
    ),
  );
}
