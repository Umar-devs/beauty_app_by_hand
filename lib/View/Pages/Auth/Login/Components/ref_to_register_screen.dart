import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Widgets/Reusable Components/reusable_txt.dart';
import '../../Register/register_screen.dart';

class ReferenceToRegisterScreen extends StatelessWidget {
  const ReferenceToRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = screenHeight(context);
    double width = screenWidth(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ReusableText(
            weight: FontWeight.w500,
            fontSize: width * 0.03,
            lbl: 'Don`t have an account?'),
        GestureDetector(
            onTap: () {
              Get.to(
                RegisterScreen(
                  screenWidth: width,
                  screenHeight: height,
                ),
                transition: Transition.rightToLeft,
              );
            },
            child: ReusableText(
              weight: FontWeight.w600,
              fontSize: width * 0.035,
              lbl: '  Register',
              clr: Colors.black,
            ))
      ],
    );
  }
}
