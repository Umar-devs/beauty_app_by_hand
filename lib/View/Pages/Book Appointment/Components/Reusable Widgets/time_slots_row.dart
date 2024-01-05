import 'package:beauty_app_by_hand/Controller/Appointment%20Controllers/get_time_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Controller/Appointment Controllers/time_slots_controller.dart';
import '../../../../Data/lists.dart';
import '../../../Widgets/Reusable Components/reusable_txt.dart';

class TimeSlotsRow extends StatelessWidget {
  TimeSlotsRow({
    super.key,
    required this.screenWidth,
    required this.loopStartNumber,
    required this.loopEndNumber,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.wantSpace = false,
    required this.screenHeight,
  });
  final double screenWidth;
  final double screenHeight;
  final int loopStartNumber;
  final int loopEndNumber;
  final MainAxisAlignment mainAxisAlignment;
  final bool wantSpace;
  final TimeSlotController timeSlotController = Get.put(TimeSlotController());
  final GetTimeController getTimeController = Get.put(GetTimeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.023),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          for (int i = loopStartNumber; i < loopEndNumber; i++)
            GestureDetector(
              onTap: () {
                timeSlotController.changeIndex(i);
                getTimeController.getTime(timeSlots[i]);
              },
              child: SizedBox(
                width: screenWidth * 0.3,
                height: screenHeight * 0.06,
                child: Obx(() => Chip(
                      padding: const EdgeInsets.all(10),
                      elevation: 1,
                      label: ReusableText(
                          weight: timeSlotController.selectedIndex.value == i
                              ? FontWeight.w700
                              : FontWeight.w500,
                          fontSize: screenWidth * 0.03,
                          clr: Colors.black,
                          lbl: timeSlots[i]),
                      backgroundColor:
                          timeSlotController.selectedIndex.value == i
                              ? const Color(0xffebc1a9).withOpacity(0.5)
                              : Colors.white,
                      side: const BorderSide(color: Colors.black12, width: 1),
                    )),
              ),
            ),
          wantSpace == true
              ? Container(
                  width: screenWidth * 0.32,
                  height: screenHeight * 0.045,
                  color: Colors.transparent,
                )
              : const SizedBox(
                  width: 0,
                  height: 0,
                ),
        ],
      ),
    );
  }
}
