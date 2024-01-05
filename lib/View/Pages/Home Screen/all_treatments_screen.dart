import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/Services/Treatment%20Services/save_data.dart';
import 'package:beauty_app_by_hand/View/Data/lists.dart';
import 'package:beauty_app_by_hand/View/Pages/Details%20Screen/details_screen.dart';
import 'package:beauty_app_by_hand/View/Pages/Home%20Screen/Components/Widgets/all_treatments_image_box.dart';
import 'package:beauty_app_by_hand/View/Pages/Widgets/Reusable%20Components/back_btn.dart';
import 'package:beauty_app_by_hand/View/Pages/Widgets/Reusable%20Components/reusable_txt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllTreatmentsScreen extends StatelessWidget {
  const AllTreatmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = screenWidth(context);
    final double height = screenHeight(context);

    return SafeArea(
      child: SizedBox(
        height: height,
        width: width,
        child: ColoredBox(
          color: themeLightColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.01),
                  child: Row(
                    children: [
                      BackBtn(
                        screenWidth: width,
                      ),
                      SizedBox(
                        width: width * 0.2,
                      ),
                      ReusableText(
                          weight: FontWeight.w600,
                          fontSize: width * 0.045,
                          lbl: 'All Treatments'),
                    ],
                  ),
                ),
                for (int i = 0; i < 9; i++)
                  GestureDetector(
                      onTap: () {
                        saveCategory(categories[i]);
                        Get.to(
                            DetailsScreen(
                              title: categories[i],
                              categoryDetails: categoryDetails[i],
                              numOfSubCategories: categories[i] ==
                                      'Hair Styling'
                                  ? subCategoriesHair.length
                                  : categories[i] == 'Facial'
                                      ? subCategoriesFacial.length
                                      : categories[i] == 'Nails'
                                          ? subCategoriesNails.length
                                          : categories[i] == 'Massage'
                                              ? subCategoriesMassage.length
                                              : categories[i] == 'HairDressing'
                                                  ? subCategoriesHairDressing
                                                      .length
                                                  : categories[i] == 'Spray Tan'
                                                      ? subCategoriesSprayTan
                                                          .length
                                                      : categories[i] ==
                                                              'Waxing'
                                                          ? subCategoriesWaxing
                                                              .length
                                                          : categories[i] ==
                                                                  'Lashes & Brows'
                                                              ? subCategoriesLashes
                                                                  .length
                                                              : subCategoriesMakeUp
                                                                  .length,
                            ),
                            transition: Transition.size);
                      },
                      child: TreatmentsImgBox(
                          screenWidth: width, screenHeight: height, i: i))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
