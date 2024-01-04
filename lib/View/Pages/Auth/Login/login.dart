import 'package:beauty_app_by_hand/Controller/Auth%20Controller/loading_stop_controller.dart';
import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controller/Auth Controller/auth_controller.dart';
import '../../Widgets/Reusable Components/reusable_txt.dart';
import '../../Widgets/Reusable Components/txt_field.dart';
import 'Components/forgot_password.dart';
import 'Components/login_btn.dart';
import 'Components/or_text_row.dart';
import 'Components/ref_to_register_screen.dart';
import 'Components/social_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController controller = Get.put(AuthController());
  final loginEmailTextController = TextEditingController();
  final loginPasswordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final LoadingStopController loadingStopController =
      Get.put(LoadingStopController());
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: themeLightColor,
      child: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.05),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/login icon.png',
                height: screenHeight * 0.12,
                width: screenWidth * 0.24,
              ),
              Column(
                children: [
                  ReusableText(
                    weight: FontWeight.w600,
                    fontSize: screenWidth * 0.065,
                    lbl: 'Beauty',
                    clr: Colors.black,
                  ),
                  ReusableText(
                      weight: FontWeight.w500,
                      fontSize: screenWidth * 0.025,
                      clr: Colors.black,
                      lbl: 'The Beauty App'),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.073,
                ),
                child: TxtField(
                    textEditingController: loginEmailTextController,
                    label: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    fieldIcon: Icon(
                      Icons.email,
                      size: screenWidth * 0.055,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    errorMessage: 'please! Enter Your Email'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.073,
                ),
                child: TxtField(
                    textEditingController: loginPasswordTextController,
                    label: 'Password',
                    fieldIcon: Icon(
                      Icons.lock,
                      size: screenWidth * 0.055,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    errorMessage: 'please! Enter Password'),
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    controller.login(loginEmailTextController.text.toString(),
                        loginPasswordTextController.text.toString());
                    setState(() {
                      tapped = true;
                    });
                  }
                },
                child: LoginBtn(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ),
              const ForgotPasswordText(),
              const OrTextRow(),
              SocialLoginRow(),
              const ReferenceToRegisterScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
