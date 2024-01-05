import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/View/Data/lists.dart';
import 'package:beauty_app_by_hand/View/Pages/Auth/Register/Components/Widgets/chk_box_tile.dart';
import 'package:beauty_app_by_hand/View/Pages/Auth/Register/Components/Widgets/register_btn.dart';
import 'package:beauty_app_by_hand/View/Pages/Auth/Register/register_data.dart';
import 'package:flutter/material.dart';
import '../../Widgets/Reusable Components/reusable_txt.dart';
import '../../Widgets/Reusable Components/txt_field.dart';
import 'Components/Widgets/reference_to_login_screen_register_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen(
      {super.key, required this.screenHeight, required this.screenWidth});
  final double screenHeight;
  final formKey = GlobalKey<FormState>();
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: themeLightColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Align(
                alignment: Alignment.center,
                child: ReusableText(
                  weight: FontWeight.w600,
                  fontSize: screenWidth * 0.065,
                  lbl: 'Beauty App',
                  clr: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.085,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ReusableText(
                      weight: FontWeight.w600,
                      fontSize: screenHeight * 0.02,
                      lbl: 'Enter Details'),
                ),
              ),
              for (int i = 0; i < 4; i++)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.073,
                  ),
                  child: TxtField(
                      label: registerFieldsHints[i],
                      textEditingController: txtControllersRegister[i],
                      fieldIcon: Icon(
                        registerIcons[i],
                        size: screenWidth * 0.055,
                        color: Colors.black.withOpacity(0.4),
                      ),
                      errorMessage: 'This Field is Empty!'),
                ),
              ChkBoxTile(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              RegisterBtn(
                  screenWidth: screenWidth,
                  formKey: formKey,
                  screenHeight: screenHeight),
              SizedBox(
                height: screenWidth * 0.01,
              ),
              const ReferenceToLoginScreenRow(),
              SizedBox(
                height: screenHeight * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
