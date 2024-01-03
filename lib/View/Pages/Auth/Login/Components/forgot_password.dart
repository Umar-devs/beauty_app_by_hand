import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widgets/Reusable Components/reusable_txt.dart';
import '../forgot_password.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
          onTap: () {
            Get.to(ForgotPasswordScreen(),
                transition: Transition.fadeIn,
               );
          },
          child: ReusableText(
              weight: FontWeight.w500,
              fontSize: screenWidth * 0.03333,
              clr: Colors.black,
              lbl: 'Forgot Password?')),
    );
  }
}
