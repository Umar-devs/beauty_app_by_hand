import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/Core/utils.dart';
import 'package:beauty_app_by_hand/View/Pages/Auth/Login/login_data.dart';
import 'package:flutter/material.dart';
import '../../Widgets/Reusable Components/reusable_txt.dart';
import '../../Widgets/Reusable Components/txt_field.dart';
import 'Components/forgot_password.dart';
import 'Components/login_btn.dart';
import 'Components/or_text_row.dart';
import 'Components/ref_to_register_screen.dart';
import 'Components/social_login.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = screenHeight(context);
    double width = screenWidth(context);
    return Container(
      height: height,
      width: width,
      color: themeLightColor,
      margin: EdgeInsets.only(top: height * 0.05),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/login icon.png',
              height: height * 0.12,
              width: width * 0.24,
            ),
            Column(
              children: [
                ReusableText(
                  weight: FontWeight.w600,
                  fontSize: width * 0.065,
                  lbl: 'Beauty',
                  clr: Colors.black,
                ),
                ReusableText(
                    weight: FontWeight.w500,
                    fontSize: width * 0.025,
                    clr: Colors.black,
                    lbl: 'The Beauty App'),
              ],
            ),
            for (int i = 0; i < 2; i++)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.073,
                ),
                child: TxtField(
                    textEditingController: txtControllers[i],
                    label: hintTxt[i],
                    keyboardType: TextInputType.emailAddress,
                    fieldIcon: Icon(
                      iconsList[i],
                      size: width * 0.055,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    errorMessage: errorMsj[i]),
              ),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  authController.login(
                      loginEmailTextController.text.toString(),
                      loginPasswordTextController.text.toString());
                  Utils().toastMessage('Checking User Credentials');
                }
              },
              child: LoginBtn(
                screenWidth: width,
                screenHeight: height,
              ),
            ),
            const ForgotPasswordText(),
            const OrTextRow(),
            SocialLoginRow(),
            const ReferenceToRegisterScreen(),
          ],
        ),
      ),
    );
  }
}