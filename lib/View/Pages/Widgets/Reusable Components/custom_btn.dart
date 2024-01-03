import 'package:beauty_app_by_hand/View/Pages/Widgets/Reusable%20Components/reusable_txt.dart';
import 'package:flutter/material.dart';

import '../../../../Core/constants.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.btnHeight,
    required this.btnWidth,
    required this.onTapFunction,
    required this.txtWeight,
    required this.txtFontSize,
    required this.lbl,
    this.pkjScreen = false,
    this.clr = Colors.transparent,
    required this.txtColor,
  });
  final double btnHeight;
  final double btnWidth;
  final VoidCallback onTapFunction;
  final FontWeight txtWeight;
  final double txtFontSize;
  final String lbl;

  final Color clr;
  final Color txtColor;
  final bool pkjScreen;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: themeLightColor,
      elevation: 0,
      child: InkWell(
        onTap: onTapFunction,
        child: Container(
          height: btnHeight,
          width: btnWidth,
          decoration: BoxDecoration(
            color: clr,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Center(
            child: ReusableText(
                weight: txtWeight,
                fontSize: txtFontSize,
                clr: txtColor,
                lbl: lbl),
          ),
        ),
      ),
    );
  }
}
