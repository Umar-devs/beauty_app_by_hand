import 'package:flutter/material.dart';
import '../../../Widgets/Reusable Components/reusable_txt.dart';

class PopularTreatmentsTxt extends StatelessWidget {
  const PopularTreatmentsTxt({super.key, required this.screenWidth});
final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ReusableText(
          weight: FontWeight.w600,
          fontSize: screenWidth * 0.035,
          lbl: 'Popular Treatments'),
    );
  }
}
