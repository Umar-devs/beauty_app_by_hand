import 'package:beauty_app_by_hand/View/Pages/Home%20Screen/all_treatments_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widgets/Reusable Components/reusable_txt.dart';

class TreatmentBookTitleRow extends StatelessWidget {
  const TreatmentBookTitleRow(
      {super.key, required this.screenWidth, required this.screenHeight});
  final double screenWidth;
  final double screenHeight;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
            weight: FontWeight.w600,
            fontSize: screenWidth * 0.04,
            lbl: 'Book a treatment'),
        GestureDetector(
          onTap: () {
            Get.to(
              const AllTreatmentsScreen(),
              transition: Transition.downToUp,
            );
          },
          child: Container(
            height: screenHeight * 0.05,
            width: screenWidth * 0.25,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.grey, offset: Offset(0, 0))
                ]),
            child: Center(
              child: ReusableText(
                  weight: FontWeight.w600,
                  fontSize: screenWidth * 0.033,
                  lbl: 'View All'),
            ),
          ),
        )
      ],
    );
  }
}
