import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/View/Pages/Auth/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 310), () => textDisplay = true);
  }

  bool textDisplay = false;
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 2),
        () => Get.offAll(const LoginScreen(),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 500)));
    return Container(
      color: themeLightColor,
      child: Center(
        child: FutureBuilder(
          future: Future.delayed(const Duration(milliseconds: 500)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return AnimatedContainer(
                width: 0.0,
                height: 0.0,
                duration: Duration.zero,
                child: Image.asset(
                  'assets/images/splash icon.png',
                  color: Colors.black,
                ),
              );
            } else {
              return AnimatedContainer(
                  width: 200,
                  height: 300,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/splash icon.png',
                        color: Colors.black,
                      ),
                    ],
                  ));
            }
          },
        ),
      ),
    );
  }
}
