import 'package:beauty_app_by_hand/Core/constants.dart';
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

    double height=screenHeight(context);
    double width=screenWidth(context);
    return SizedBox(
      width: width,
      child: Row(
        children: [
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            width: width * 0.06,
          ),
          Expanded(
              flex: 1,
              child: SizedBox(
                height: height * 0.05,
                width: width * 0.16,
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
                          height: height * 0.15,
                          width: width * 0.5,
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
                      Get.to( const HomeScreen(),
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
            width: width * 0.03,
          ),
          Expanded(
              flex: 1,
              child: SizedBox(
                width: width * 0.18,
                height: height * 0.05,
                child: SignInButtonBuilder(
                  highlightColor: Colors.grey.shade200,
                  splashColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  onPressed: () {
                    controller.signInWithFacebook().then((value) => {
                          Get.to( const HomeScreen(),
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
