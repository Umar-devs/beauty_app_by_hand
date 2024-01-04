import 'package:flutter/material.dart';

import '../../../../Widgets/Reusable Components/reusable_txt.dart';
import 'package:get/get.dart';

import '../../../Login/login.dart';
class ReferenceToLoginScreenRow extends StatelessWidget {
  const ReferenceToLoginScreenRow({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ReusableText(
            weight: FontWeight.w500,
            fontSize: screenWidth * 0.03,
            lbl: 'Already have an account?'),
        GestureDetector(
            onTap: () {
              Get.to( LoginScreen(),
                  transition: Transition.leftToRight,
                 );
            },
            child: ReusableText(
              weight: FontWeight.w600,
              fontSize: screenWidth * 0.035,
              lbl: '  Login',
              clr: Colors.black,
            ))
      ],
    );
  }
}
