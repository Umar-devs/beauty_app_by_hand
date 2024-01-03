import 'package:beauty_app_by_hand/Services/Treatment%20Services/save_data.dart';
import 'package:beauty_app_by_hand/View/Pages/Details%20Screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Data/lists.dart';

class Treatments extends StatelessWidget {
  const Treatments(
      {super.key, required this.screenWidth, required this.screenHeight});
  final double screenWidth;
  final double screenHeight;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          for (int i = 0; i < 9; i++)
            GestureDetector(
              onTap: () {
                saveCategory(categories[i]);
                Get.to(
                    DetailsScreen(
                      title: categories[i],
                      categoryDetails: categoryDetails[i],
                      numOfSubCategories: categories[i] == 'Hair Styling'
                          ? subCategoriesHair.length
                          : categories[i] == 'Facial'
                              ? subCategoriesFacial.length
                              : categories[i] == 'Nails'
                                  ? subCategoriesNails.length
                                  : categories[i] == 'Massage'
                                      ? subCategoriesMassage.length
                                      : categories[i] == 'HairDressing'
                                          ? subCategoriesHairDressing.length
                                          : categories[i] == 'Spray Tan'
                                              ? subCategoriesSprayTan.length
                                              : categories[i] == 'Waxing'
                                                  ? subCategoriesWaxing.length
                                                  : categories[i] ==
                                                          'Lashes & Brows'
                                                      ? subCategoriesLashes
                                                          .length
                                                      : subCategoriesMakeUp
                                                          .length,
                    ),
                    transition: Transition.size);
              },
              child: Container(
                margin: EdgeInsets.only(
                    right: i == 8 ? 0 : screenWidth * 0.05, bottom: 0, top: 0),
                height: screenHeight * 0.33,
                width: screenWidth * 0.65,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(1, 1),
                          spreadRadius: 1.5,
                          blurRadius: 1),
                    ],
                    image: DecorationImage(
                        image: AssetImage(imagesHomeScreen[i]),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
        ],
      ),
    );
  }
}
