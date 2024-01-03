import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widgets/Reusable Components/reusable_txt.dart';
import '../../Register/register_screen.dart';

class ReferenceToRegisterScreen extends StatelessWidget {
  const ReferenceToRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ReusableText(
            weight: FontWeight.w500,
            fontSize: screenWidth * 0.03,
            lbl: 'Don`t have an account?'),
        GestureDetector(
            onTap: () {
              Get.to(
                RegisterScreen(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
                transition: Transition.rightToLeft,
              );
            },
            child: ReusableText(
              weight: FontWeight.w600,
              fontSize: screenWidth * 0.035,
              lbl: '  Register',
              clr: Colors.black,
            ))
      ],
    );
  }
}
