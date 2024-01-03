import 'package:flutter/material.dart';
import '../../../Widgets/Reusable Components/reusable_txt.dart';

class SubCategory extends StatelessWidget {
  const SubCategory(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.subCategoriesTitle,
      required this.subCategoryDetails,
      required this.subCategoryPrice});
  final double screenWidth;
  final double screenHeight;
  final String subCategoriesTitle;
  final String subCategoryDetails;
  final String subCategoryPrice;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.175,
      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ReusableText(
                weight: FontWeight.w600,
                fontSize: screenWidth * 0.04,
                alignTxt: TextAlign.start,
                lbl: subCategoriesTitle),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ReusableText(
                weight: FontWeight.w400,
                alignTxt: TextAlign.start,
                fontSize: screenWidth * 0.035,
                lbl: subCategoryDetails),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReusableText(
                  weight: FontWeight.w500,
                  fontSize: screenWidth * 0.037,
                  clr: const Color(0xffa74c75),
                  lbl: 'Book now'),
              ReusableText(
                  weight: FontWeight.w500,
                  fontSize: screenWidth * 0.035,
                  clr: Colors.grey.shade500,
                  lbl: subCategoryPrice),
            ],
          ),
        ],
      ),
    );
  }
}
