import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/Address Controller/get_address_controller.dart';
import '../../../Controller/Auth Controller/auth_controller.dart';
import '../../../Controller/Profile controller/about_app_controller.dart';
import '../../../Controller/Profile controller/email_controller.dart';
import '../../../Controller/Profile controller/name_controller.dart';

final NameController nameController = Get.put(NameController());
final EmailController emailController = Get.put(EmailController());
final GetPhoneController getPhoneController = Get.put(GetPhoneController());
final AboutAppController aboutAppController = Get.put(AboutAppController());
final AuthController authController = Get.put(AuthController());

final lane1TextController = TextEditingController();
final lane2TextController = TextEditingController();
final cityTextController = TextEditingController();
final countyTextController = TextEditingController();
final currentPassTextController = TextEditingController();
final newPassTextController = TextEditingController();
final phoneTextController = TextEditingController();
final nameTextController = TextEditingController();

final User? user = FirebaseAuth.instance.currentUser;