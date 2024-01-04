import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/View/Data/lists.dart';
import 'package:beauty_app_by_hand/View/Pages/Auth/Login/login_data.dart';
import 'package:beauty_app_by_hand/View/Pages/Auth/Register/terms_and_conditions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controller/Auth Controller/auth_controller.dart';
import '../../../../Core/utils.dart';
import '../../Widgets/Reusable Components/reusable_txt.dart';
import '../../Widgets/Reusable Components/txt_field.dart';
import 'Components/Widgets/reference_to_login_screen_register_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen(
      {super.key, required this.screenWidth, required this.screenHeight});
  final double screenWidth;
  final double screenHeight;
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController controller = Get.put(AuthController());

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {


    return Container(
      height: widget.screenHeight,
      width: widget.screenWidth,
      color: themeLightColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: widget.screenHeight * 0.01),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: widget.screenHeight * 0.02,
              ),
              Align(
                alignment: Alignment.center,
                child: ReusableText(
                  weight: FontWeight.w600,
                  fontSize: widget.screenWidth * 0.065,
                  lbl: 'Beauty App',
                  clr: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: widget.screenWidth * 0.085,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ReusableText(
                      weight: FontWeight.w600,
                      fontSize: widget.screenHeight * 0.02,
                      lbl: 'Enter Details'),
                ),
              ),
              for (int i = 0; i < 4; i++)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.screenWidth * 0.073,
                  ),
                  child: TxtField(
                      label: registerFieldsHints[i],
                      textEditingController: txtControllers[i],
                      fieldIcon: Icon(
                        registerIcons[i],
                        size: widget.screenWidth * 0.055,
                        color: Colors.black.withOpacity(0.4),
                      ),
                      errorMessage: 'This Field is Empty!'),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: widget.screenWidth,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: widget.screenWidth * 0.015,
                      ),
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: CheckboxListTile(
                          checkColor: Colors.white,
                          activeColor: const Color(0xff063585),
                          title: GestureDetector(
                            onTap: () {
                              Get.to(
                                  TermsAndConditions(
                                    screenWidth: widget.screenWidth,
                                    screenHeight: widget.screenHeight,
                                  ),
                                  transition: Transition.rightToLeft);
                            },
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  text: 'Accept our ',
                                  children: [
                                    TextSpan(
                                        text: 'Terms of use and Privacy Policy',
                                        style: TextStyle(
                                            fontSize:
                                                widget.screenWidth * 0.027,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))
                                  ],
                                  style: TextStyle(
                                      fontSize: widget.screenWidth * 0.029,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                            ),
                          ),
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.screenWidth * 0.073,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (checkedValue != true) {
                        Utils().toastMessage(
                            'please! Accept our Terms and Conditions to proceed');
                      } else {
                        if (_formKey.currentState!.validate()) {
                          Utils().toastMessage('Working..');
                          if (txtControllers[2].text !=
                              txtControllers[3].text) {
                            Utils().toastMessage('Password not match');
                            return;
                          }

                          controller.signUp(
                            txtControllers[1],
                            txtControllers[2],
                            txtControllers[0].text.toString(),
                          );
                        }
                      }
                    },
                    child: Container(
                      height: widget.screenHeight * 0.067,
                      width: widget.screenWidth,
                      decoration: BoxDecoration(
                          color: themeColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: ReusableText(
                          weight: FontWeight.w600,
                          fontSize: widget.screenWidth * 0.04,
                          lbl: 'Register',
                          clr: Colors.black,
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: widget.screenWidth * 0.01,
              ),
              const ReferenceToLoginScreenRow(),
              SizedBox(
                height: widget.screenHeight * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
