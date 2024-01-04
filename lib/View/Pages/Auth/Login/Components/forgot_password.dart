import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widgets/Reusable Components/reusable_txt.dart';
import '../forgot_password.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    double width=screenWidth(context);
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
              fontSize: width * 0.03333,
              clr: Colors.black,
              lbl: 'Forgot Password?')),
    );
  }
}
