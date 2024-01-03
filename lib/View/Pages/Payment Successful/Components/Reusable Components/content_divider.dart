import 'package:flutter/material.dart';

class ContentDivider extends StatelessWidget {
  const ContentDivider({super.key, required this.screenWidth});
final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return  Divider(
      indent: screenWidth * 0.03,
      endIndent: screenWidth * 0.03,
      color: Colors.black12,
    );
  }
}
