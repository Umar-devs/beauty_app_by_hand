import 'package:beauty_app_by_hand/View/Pages/Home%20Screen/home_screen.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../../Controller/Auth Controller/auth_controller.dart';

class SocialLoginRow extends StatelessWidget {
   SocialLoginRow({super.key});
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {

    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      child: Row(
        children: [
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            width: screenWidth * 0.06,
          ),
          Expanded(
              flex: 1,
              child: SizedBox(
                height: screenHeight * 0.05,
                width: screenWidth * 0.16,
                child: SignInButtonBuilder(
                  highlightColor: Colors.grey.shade200,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  onPressed: () {
                    Get.defaultDialog(
                        backgroundColor: Colors.grey.shade400,
                        title: '',
                        titleStyle: const TextStyle(fontSize: 0),
                        content: SizedBox(
                          height: screenHeight * 0.15,
                          width: screenWidth * 0.5,
                          child: const Column(
                            children: [
                              Spacer(),
                              CircularProgressIndicator(
                                color: Color(0xff063585),
                              ),
                              Spacer(),
                            ],
                          ),
                        ));
                    controller.signInWithGoogle().then((value) {
                      Get.to( HomeScreen(),
                        transition: Transition.fadeIn,
                      );
                    });
                  },
                  text: '',
                  image: Image.asset(
                    'assets/images/google logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
              )),
          SizedBox(
            width: screenWidth * 0.03,
          ),
          Expanded(
              flex: 1,
              child: SizedBox(
                width: screenWidth * 0.18,
                height: screenHeight * 0.05,
                child: SignInButtonBuilder(
                  highlightColor: Colors.grey.shade200,
                  splashColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  onPressed: () {
                    controller.signInWithFacebook().then((value) => {
                          Get.to( HomeScreen(),
                              transition: Transition.fadeIn,
                              duration: const Duration(milliseconds: 700))
                        });
                  },
                  text: '',
                  image: Image.asset(
                    'assets/images/fb logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
              )),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
