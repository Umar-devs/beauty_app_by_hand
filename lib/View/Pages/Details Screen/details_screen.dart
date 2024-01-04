import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/Services/Treatment%20Services/save_data.dart';
import 'package:beauty_app_by_hand/View/Data/lists.dart';
import 'package:beauty_app_by_hand/View/Pages/Book%20Appointment/book_appointment_screen.dart';
import 'package:beauty_app_by_hand/View/Pages/Details%20Screen/Components/Reusable%20Component/subcategory.dart';
import 'package:beauty_app_by_hand/View/Pages/Widgets/Reusable%20Components/back_btn.dart';
import 'package:beauty_app_by_hand/View/Pages/Widgets/Reusable%20Components/reusable_txt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.title,
    required this.categoryDetails,
    required this.numOfSubCategories,
  });
  final String title;
  final String categoryDetails;
  final int numOfSubCategories;
  @override
  Widget build(BuildContext context) {
    final width = screenWidth(context);
    final height = screenHeight(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackBtn(
            screenWidth: width,
          ),
          backgroundColor: themeColor,
          centerTitle: true,
          title: Text(
            title,
            textAlign: TextAlign.left,
            style: GoogleFonts.playfair(
              fontSize: width * 0.06,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: themeLightColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.035, right: width * 0.035),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.025),
                  child: ReusableText(
                      weight: FontWeight.w400,
                      fontSize: width * 0.035,
                      alignTxt: TextAlign.start,
                      lbl: categoryDetails),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.025),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        for (int i = 0; i < numOfSubCategories; i++)
                          Container(
                            margin: EdgeInsets.only(
                                right: i == numOfSubCategories - 1
                                    ? 0
                                    : width * 0.05),
                            height: height * 0.33,
                            width: width * 0.65,
                            decoration: BoxDecoration(
                                color: themeColor,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                      ],
                    ),
                  ),
                ),
                for (int i = 0; i < numOfSubCategories; i++)
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          saveSubcategory(title == categories[0]
                              ? subCategoriesHair[i]
                              : title == categories[1]
                                  ? subCategoriesFacial[i]
                                  : title == categories[2]
                                      ? subCategoriesNails[i]
                                      : title == categories[3]
                                          ? subCategoriesMassage[i]
                                          : title == categories[4]
                                              ? subCategoriesHairDressing[i]
                                              : title == categories[5]
                                                  ? subCategoriesSprayTan[i]
                                                  : title == categories[6]
                                                      ? subCategoriesWaxing[i]
                                                      : title == categories[7]
                                                          ? subCategoriesLashes[
                                                              i]
                                                          : subCategoriesMakeUp[
                                                              i]);
                          savePrice(title == categories[0]
                              ? subCategoryPriceHair[i]
                              : title == categories[1]
                                  ? subCategoryPriceFacial[i]
                                  : title == categories[2]
                                      ? subCategoryPriceNails[i]
                                      : title == categories[3]
                                          ? subCategoryPriceMassage[i]
                                          : title == categories[4]
                                              ? subCategoryPriceHairDressing[i]
                                              : title == categories[5]
                                                  ? subCategoryPriceSprayTan[i]
                                                  : title == categories[6]
                                                      ? subCategoryPriceWaxing[
                                                          i]
                                                      : title == categories[7]
                                                          ? subCategoryPriceLashes[
                                                              i]
                                                          : subCategoryPriceMakeUp[
                                                              i]);
                          Get.to(
                             BookAppointmentScreen(),
                            transition: Transition.fadeIn,
                          );
                        },
                        child: SubCategory(
                          screenWidth: width,
                          screenHeight: height,
                          subCategoriesTitle: numOfSubCategories == 4 //1
                              ? subCategoriesHair[i]
                              : numOfSubCategories == 8
                                  ? subCategoriesFacial[i]
                                  : numOfSubCategories == 9
                                      ? subCategoriesNails[i]
                                      : numOfSubCategories == 12 &&
                                              title == 'Massage'
                                          ? subCategoriesMassage[i]
                                          : numOfSubCategories == 6
                                              ? subCategoriesHairDressing[i]
                                              : numOfSubCategories == 2
                                                  ? subCategoriesSprayTan[i]
                                                  : numOfSubCategories == 12 &&
                                                          title == 'Waxing'
                                                      ? subCategoriesWaxing[i]
                                                      : numOfSubCategories == 10
                                                          ? subCategoriesLashes[
                                                              i]
                                                          : subCategoriesMakeUp[
                                                              i],
                          subCategoryDetails: numOfSubCategories == 4 //2
                              ? subCategoryDetailsHair[i]
                              : numOfSubCategories == 8
                                  ? subCategoryDetailFacial[i]
                                  : numOfSubCategories == 9
                                      ? subCategoryDetailNails[i]
                                      : numOfSubCategories == 12 &&
                                              title == 'Massage'
                                          ? subCategoryDetailMassage[i]
                                          : numOfSubCategories == 6
                                              ? subCategoryHairDressing[i]
                                              : numOfSubCategories == 2
                                                  ? subCategoryDetailsSprayTan[
                                                      i]
                                                  : numOfSubCategories == 12 &&
                                                          title == 'Waxing'
                                                      ? subCategoryDetailsWaxing[
                                                          i]
                                                      : numOfSubCategories == 10
                                                          ? subCategoryDetailsLashes[
                                                              i]
                                                          : subCategoryDetailsMakeUp[
                                                              i],
                          subCategoryPrice: numOfSubCategories == 4 //3
                              ? 'From £${subCategoryPriceHair[i]}.00'
                              : numOfSubCategories == 8
                                  ? 'From £${subCategoryPriceFacial[i]}.00'
                                  : numOfSubCategories == 9
                                      ? 'From £${subCategoryPriceNails[i]}.00'
                                      : numOfSubCategories == 12 &&
                                              title == 'Massage'
                                          ? 'From £${subCategoryPriceMassage[i]}.00'
                                          : numOfSubCategories == 6
                                              ? 'From £${subCategoryPriceHairDressing[i]}.00'
                                              : numOfSubCategories == 2
                                                  ? 'From £${subCategoryPriceSprayTan[i]}.00'
                                                  : numOfSubCategories == 12 &&
                                                          title == 'Waxing'
                                                      ? 'From £${subCategoryPriceWaxing[i]}.00'
                                                      : numOfSubCategories == 10
                                                          ? 'From £${subCategoryPriceLashes[i]}.00'
                                                          : 'From £${subCategoryPriceMakeUp[i]}.00',
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
