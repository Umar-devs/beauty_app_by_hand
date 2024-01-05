import 'package:flutter/material.dart';
import 'package:get/get.dart';

final emailTextController = TextEditingController();
final passwordTextController = TextEditingController();
final confirmPasswordTextController = TextEditingController();
final addressTextController = TextEditingController();
final nameController = TextEditingController();

List txtControllersRegister=[
  nameController,
  emailTextController,
  passwordTextController,
  confirmPasswordTextController,
];
final List registerIcons = [
  Icons.person,
  Icons.email,
  Icons.lock,
  Icons.lock,
];