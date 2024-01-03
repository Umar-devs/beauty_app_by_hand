import 'package:flutter/material.dart';

class PromotionImgBox extends StatelessWidget {
  const PromotionImgBox(
      {super.key, required this.screenWidth, required this.screenHeight, required this.img});
  final double screenWidth;
  final double screenHeight;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.03),
      height: screenHeight * 0.17,
      width: screenWidth * 0.9,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Image.asset(
     img ,
        fit: BoxFit.cover,
        colorBlendMode: BlendMode.colorBurn,
      ),
    );
  }
}
