import 'package:beauty_app_by_hand/Controller/Auth%20Controller/auth_controller.dart';
import 'package:beauty_app_by_hand/Controller/Auth%20Controller/chk_tile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../Core/constants.dart';
import '../../../../../../Core/utils.dart';
import '../../../../Widgets/Reusable Components/reusable_txt.dart';
import '../../register_data.dart';

class RegisterBtn extends StatelessWidget {
  RegisterBtn({super.key, required this.screenWidth, required this.formKey, required this.screenHeight});
  final double screenWidth;
  final double screenHeight;
  final GlobalKey<FormState> formKey;
  final ChkBoxController chkBoxController = Get.put(ChkBoxController());
  final AuthController controller=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.073,
        ),
        child: GestureDetector(
          onTap: () {
            if (chkBoxController.chkValue.value != true) {
              Utils().toastMessage(
                  'please! Accept our Terms and Conditions to proceed');
            } else {
              if (formKey.currentState!.validate()) {
                Utils().toastMessage('Working..');
                if (txtControllersRegister[2].text !=
                    txtControllersRegister[3].text) {
                  Utils().toastMessage('Password not match');
                  return;
                }

                controller.signUp(
                  txtControllersRegister[1],
                  txtControllersRegister[2],
                  txtControllersRegister[0].text.toString(),
                );
              }
            }
          },
          child: Container(
            height: screenHeight * 0.067,
            width: screenWidth,
            decoration: BoxDecoration(
                color: themeColor, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: ReusableText(
                weight: FontWeight.w600,
                fontSize: screenWidth * 0.04,
                lbl: 'Register',
                clr: Colors.black,
              ),
            ),
          ),
        ));
  }
}
