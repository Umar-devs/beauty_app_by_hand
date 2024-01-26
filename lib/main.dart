import 'package:beauty_app_by_hand/Core/utils.dart';
import 'package:beauty_app_by_hand/View/Pages/Auth/Login/login.dart';
import 'package:beauty_app_by_hand/View/Pages/Home%20Screen/home_screen.dart';
import 'package:beauty_app_by_hand/View/Pages/Nav%20Bar/my_bottom_nav_bar.dart';
import 'package:beauty_app_by_hand/View/Pages/Orders%20View/orders_view_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCl_qL6AAG52JaceN0Ff2WTHcG-7DL8SEc",
        appId: "1:375864446012:android:5edc4bb248ba5e56228739",
        messagingSenderId: '375864446012',
        projectId: 'beauty-app-d3084',
      ),
    );
  } catch (e) {
    Utils().toastMessage(e.toString());
  }
  Stripe.publishableKey =
      'pk_test_51NaBipFStNFkbcMWNOSiZIVXiXLbE3X3t4VkU4mwJz556ByEZmCszD3A3AczCsBR78r5CK9EKIi6riOQwLqMOdoy00uVFvFb7x';
  await dotenv.load(fileName: 'assets/.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance.currentUser;
    return  GetMaterialApp(
        debugShowCheckedModeBanner: false, home:
        // ProfileScreen()
        auth == null ? LoginScreen() :  MyBottomNav()
        );
  }
}
