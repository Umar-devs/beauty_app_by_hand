import 'package:flutter/material.dart';

class DarkMarginDivider extends StatelessWidget {
  const DarkMarginDivider({super.key, required this.screenWidth});
final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return  Divider(
      indent: screenWidth * 0.07,
      endIndent: screenWidth * 0.07,
      color: Colors.black54,
    );
  }
}
