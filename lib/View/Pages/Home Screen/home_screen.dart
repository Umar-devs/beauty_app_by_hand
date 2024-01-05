import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/Services/Profile%20Screen%20Data%20Services/fetch_profile_data.dart';
import 'package:beauty_app_by_hand/View/Pages/Home%20Screen/Components/Widgets/popular_treatments_txt.dart';
import 'package:beauty_app_by_hand/View/Pages/Home%20Screen/Components/Widgets/treatment_book_title_row.dart';
import 'package:beauty_app_by_hand/View/Pages/Home%20Screen/Components/Widgets/treatments.dart';
import 'package:beauty_app_by_hand/View/Pages/Home%20Screen/home_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Components/Widgets/user_info_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = screenHeight(context);
    double width = screenWidth(context);
    popularTreatmentsStore(width, height);
    fetchName();

    return SafeArea(
      child: Container(
        height: height,
        width: width,
        color: themeLightColor,
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Obx(() => UserInfoTile(
                    screenWidth: width,
                    screenHeight: height,
                    displayLetter: nameController.userName.value.isNotEmpty
                        ? nameController.userName.value
                            .substring(0, 1)
                            .toUpperCase()
                        : "..",
                    title: aboutAppController.accountTitle.value,
                  )),
              TreatmentBookTitleRow(screenWidth: width, screenHeight: height),
              SizedBox(
                height: height * 0.035,
              ),
              Treatments(screenWidth: width, screenHeight: height),
              SizedBox(
                height: height * 0.035,
              ),
              PopularTreatmentsTxt(screenWidth: width),
              SizedBox(
                height: height * 0.015,
              ),
              for (int i = 0; i < 3; i++) popularTreatmentsWidgetList[i]
            ],
          ),
        ),
      ),
    );
  }
}
