import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackBtn extends StatelessWidget {
  const BackBtn(
      {super.key,
      this.icon = Icons.chevron_left,
      this.clr = Colors.black,
       this.iconSize=25, required this.screenWidth});
  final IconData icon;
  final Color clr;
  final double iconSize;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Material(
          elevation: 0,
          color: Colors.transparent,
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                icon,
                color: clr,
                size: screenWidth * 0.08,
              ))),
    );
  }
}
