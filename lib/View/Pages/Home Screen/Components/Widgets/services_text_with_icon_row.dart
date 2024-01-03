import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Widgets/Reusable Components/reusable_txt.dart';

class ServicesTxtRow extends StatelessWidget {
  const ServicesTxtRow({super.key, required this.screenWidth, required this.screenHeight});
final double screenWidth;
final double screenHeight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 0.05,
          right: screenWidth * 0.06,
          top: screenHeight * 0.033,
          bottom: screenHeight * 0.033),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ReusableText(
              weight: FontWeight.w600,
              fontSize: screenWidth * 0.04,
              lbl: 'Services'),
          const FaIcon(FontAwesomeIcons.magic)
        ],
      ),
    );
  }
}
