import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controller/Auth Controller/auth_controller.dart';
import '../../../../Controller/Auth Controller/loading_stop_controller.dart';

final List hintTxt = [
  'Email Address',
  'Password',
];
final List iconsList = [
  Icons.email,
  Icons.lock,
];
final List errorMsj = [
  'please! Enter Your Email',
  'please! Enter Password',
];
final loginEmailTextController = TextEditingController();
final loginPasswordTextController = TextEditingController();
final List txtControllers=[
  loginEmailTextController,
  loginPasswordTextController,
];
final AuthController authController = Get.put(AuthController());
final LoadingStopController loadingStopController =
Get.put(LoadingStopController());