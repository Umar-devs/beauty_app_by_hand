import 'package:beauty_app_by_hand/Services/Treatment%20Services/save_data.dart';
import 'package:beauty_app_by_hand/View/Pages/Details%20Screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../Data/lists.dart';
import '../../../Widgets/Reusable Components/reusable_txt.dart';

class PopularTreatmentsContainer extends StatelessWidget {
  const PopularTreatmentsContainer(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.title,
      required this.subCategoryCount,
      required this.img,
      required this.pageNumber,
      required this.numberOfSubCategories});
  final double screenWidth;
  final double screenHeight;
  final String title;
  final int subCategoryCount;
  final int pageNumber;
  final int numberOfSubCategories;
  final String img;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        saveCategory(title);
        Get.to(
            DetailsScreen(
                title: title,
                categoryDetails: categoryDetails[pageNumber],
                numOfSubCategories: numberOfSubCategories),
            transition: Transition.size);
      },
      child: Container(
        height: screenHeight * 0.09,
        width: screenWidth,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffebc1a9).withOpacity(0.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: screenHeight * 0.062,
                  width: screenWidth * 0.13,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(img), fit: BoxFit.cover),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                        weight: FontWeight.w600,
                        fontSize: screenWidth * 0.035,
                        alignTxt: TextAlign.left,
                        lbl: title),
                    SizedBox(
                      height: screenHeight * 0.002,
                    ),
                    ReusableText(
                        weight: FontWeight.w400,
                        fontSize: screenWidth * 0.03,
                        alignTxt: TextAlign.left,
                        clr: Colors.black87,
                        lbl: '$subCategoryCount Treatments'),
                  ],
                ),
              ],
            ),
            Container(
              height: screenHeight * 0.042,
              width: screenWidth * 0.22,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(-1, -1),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ReusableText(
                      weight: FontWeight.w600,
                      fontSize: screenWidth * 0.032,
                      lbl: 'View'),
                  FaIcon(
                    FontAwesomeIcons.externalLinkAlt,
                    size: screenWidth * 0.035,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
