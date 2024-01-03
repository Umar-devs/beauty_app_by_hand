import 'package:beauty_app_by_hand/Controller/nav_bar_controller.dart';
import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import '../../Data/widgets_list.dart';

class MyBottomNav extends StatelessWidget {
  MyBottomNav(
      {super.key, required this.screenHeight, required this.screenWidth});
  final double screenHeight;
  final double screenWidth;
  final NavBarController navBarController = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        animationCurve: Curves.linearToEaseOut,
        height: screenHeight * 0.08,
        onTap: (index) {
          navBarController.changeIndex(index);
        },
        items: [
          iconsBottomNav[0],
          iconsBottomNav[1],
          iconsBottomNav[2],
        ],
        color:  themeColor,
        backgroundColor: themeLightColor,
        buttonBackgroundColor: themeColor,
      ),
      body: Obx(
          () => widgetOptions.elementAt(navBarController.selectedIndex.value)),
    );
  }
}
