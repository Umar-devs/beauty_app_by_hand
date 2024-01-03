import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../Widgets/Reusable Components/custom_btn.dart';
import '../../Widgets/Reusable Components/reusable_txt.dart';
import '../../Widgets/Reusable Components/txt_field.dart';



class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final forgotPasswordController = TextEditingController();
  // final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: themeLightColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.07),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.045,
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.arrowLeft,
                          color:Colors.black,
                        ))),
              ),
              // SizedBox(height: screenHeight*0.25,),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.073,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ReusableText(
                      weight: FontWeight.w600,
                      fontSize: screenHeight * 0.02,
                      clr: Colors.black,
                      lbl: 'Reset Password?'),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.073,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ReusableText(
                    weight: FontWeight.w400,
                    fontSize: screenWidth * 0.025,
                    lbl:
                    'Don`r worry it occurs, Please enter the email \naddress linked with your account',
                    alignTxt: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenWidth * 0.05,
                  horizontal: screenWidth * 0.055,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TxtField(
                      textEditingController: forgotPasswordController,
                      label: 'Enter Your Email',
                      errorMessage: 'please! Enter Email'),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.055,
                ),
                child: CustomBtn(
                    btnHeight: screenHeight * 0.067,
                    btnWidth: screenWidth,
                    clr: themeColor,
                    onTapFunction: () {
                      // if (_formKey.currentState!.validate()) {
                      //   auth
                      //       .sendPasswordResetEmail(
                      //       email: forgotPasswordController.text.toString())
                      //       .then((value) {
                      //     Utils().toastMessage(
                      //         'We have sent an email to account provided, check to reset password');
                      //     Future.delayed(
                      //         const Duration(seconds: 1),
                      //             () => Get.to(const ForgotPasswordDoneScreen(),
                      //             transition: Transition.fadeIn,
                      //             duration:  const Duration(milliseconds: 700)));
                      //   }).onError((error, stackTrace) {
                      //     Utils().toastMessage(error.toString());
                      //   });
                      // }
                    },
                    txtWeight: FontWeight.w600,
                    txtFontSize: screenWidth * 0.04,
                    lbl: 'Send Email', txtColor: Colors.black,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
