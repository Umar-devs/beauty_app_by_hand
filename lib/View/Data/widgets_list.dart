import 'package:beauty_app_by_hand/View/Pages/Book%20Appointment/book_appointment_screen.dart';
import 'package:flutter/material.dart';
import '../Pages/Home Screen/home_screen.dart';
import '../Pages/Profile Screen/profile_screen.dart';

final List<Widget> widgetOptions = [
  const BookAppointmentScreen(),
  HomeScreen(),
   ProfileScreen(),
];
final List iconsBottomNav = [
  const Icon(
    Icons.menu_book_outlined,
    color: Colors.white,
    size: 35,
  ),
  const Icon(
    Icons.home_outlined,
    color: Colors.white,
    size: 35,
  ),
  const Icon(
    Icons.person_outline_rounded,
    color: Colors.white,
    size: 35,
  )
];
