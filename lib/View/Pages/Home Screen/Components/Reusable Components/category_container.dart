import 'package:beauty_app_by_hand/Controller/service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Core/constants.dart';
import '../../../../Data/lists.dart';
import '../../../Widgets/Reusable Components/reusable_txt.dart';

class CategoryContainer extends StatelessWidget {
  CategoryContainer(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.index});
  final double screenWidth;
  final double screenHeight;
  final int index;
  final ServiceController serviceController = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        serviceController.changeIndex(index);
      },
      child: Obx(() => Container(
            height: screenHeight * 0.02,
            width: screenWidth * 0.22,
            decoration: BoxDecoration(
                gradient: serviceController.selectedIndex.value == index
                    ? const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                            Color(0xffd66986),
                            Color(0xffdf7b8d),
                            Color(0xffed9598),
                          ])
                    : const LinearGradient(colors: [
                        Colors.white,
                        Colors.white,
                      ]),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: themeColor)),
            child: Center(
              child: ReusableText(
                  weight: FontWeight.w600,
                  fontSize: screenWidth * 0.035,
                  clr: serviceController.selectedIndex.value == index
                      ? Colors.white
                      : Colors.black,
                  lbl: categories[index]),
            ),
          )),
    );
  }
}
