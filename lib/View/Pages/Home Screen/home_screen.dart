import 'package:beauty_app_by_hand/Controller/Profile%20controller/about_app_controller.dart';
import 'package:beauty_app_by_hand/Controller/Profile%20controller/name_controller.dart';
import 'package:beauty_app_by_hand/Controller/service_controller.dart';
import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/Services/Profile%20Screen%20Data%20Services/fetch_profile_data.dart';
import 'package:beauty_app_by_hand/View/Pages/Home%20Screen/Components/Reusable%20Components/popular_services_container.dart';
import 'package:beauty_app_by_hand/View/Pages/Home%20Screen/Components/Widgets/popular_treatments_txt.dart';
import 'package:beauty_app_by_hand/View/Pages/Home%20Screen/Components/Widgets/treatment_book_title_row.dart';
import 'package:beauty_app_by_hand/View/Pages/Home%20Screen/Components/Widgets/treatments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Data/lists.dart';
import 'Components/Widgets/user_info_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ServiceController serviceController = Get.put(ServiceController());
  final AboutAppController aboutAppController = Get.put(AboutAppController());
  final NameController nameController = Get.put(NameController());
  @override
  Widget build(BuildContext context) {
    fetchName();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        height: screenHeight,
        width: screenWidth,
        color: themeLightColor,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
             Obx(() =>  UserInfoTile(
               screenWidth: screenWidth,
               screenHeight: screenHeight,
               displayLetter: nameController.userName.value.isNotEmpty
                   ? nameController.userName.value
                   .substring(0, 1)
                   .toUpperCase()
                   : "..",
               title: aboutAppController.accountTitle.value,
             )),
              TreatmentBookTitleRow(
                  screenWidth: screenWidth, screenHeight: screenHeight),
              SizedBox(
                height: screenHeight * 0.035,
              ),
              Treatments(screenWidth: screenWidth, screenHeight: screenHeight),
              SizedBox(
                height: screenHeight * 0.035,
              ),
              PopularTreatmentsTxt(screenWidth: screenWidth),
              SizedBox(
                height: screenHeight * 0.015,
              ),
              PopularTreatmentsContainer(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                title: treatmentsNames[1],
                subCategoryCount: subCategoriesFacial.length,
                img: imagesHomeScreen[1],
                pageNumber: 1,
                numberOfSubCategories: subCategoriesFacial.length,
              ),
              PopularTreatmentsContainer(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                title: treatmentsNames[3],
                img: imagesHomeScreen[3],
                subCategoryCount: subCategoriesMassage.length,
                pageNumber: 3,
                numberOfSubCategories: subCategoriesMassage.length,
              ),
              PopularTreatmentsContainer(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                img: imagesHomeScreen[8],
                title: treatmentsNames[8],
                subCategoryCount: subCategoriesMakeUp.length,
                pageNumber: 8,
                numberOfSubCategories: subCategoriesMakeUp.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
