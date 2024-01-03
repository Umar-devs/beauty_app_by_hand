import 'package:beauty_app_by_hand/Controller/Appointment%20Controllers/get_date_controller.dart';
import 'package:beauty_app_by_hand/Controller/Appointment%20Controllers/get_time_controller.dart';
import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/Services/Appointment%20Services/save_data.dart';
import 'package:beauty_app_by_hand/View/Pages/Book%20Appointment/Components/Reusable%20Widgets/time_slots_row.dart';
import 'package:beauty_app_by_hand/View/Pages/Book%20Appointment/Components/Reusable%20Widgets/time_title.dart';
import 'package:beauty_app_by_hand/View/Pages/Book%20Appointment/Components/Widgets/calender_widget.dart';
import 'package:beauty_app_by_hand/View/Pages/Save%20Address%20&%20Phone/save_address_phone_screen.dart';
import 'package:beauty_app_by_hand/View/Pages/Widgets/Reusable%20Components/custom_btn.dart';
import 'package:beauty_app_by_hand/View/Pages/Widgets/Reusable%20Components/reusable_txt.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final GetTimeController getTimeController = Get.put(GetTimeController());
    final GetDateController getDateController = Get.put(GetDateController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffebc1a9).withOpacity(0.5),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              FontAwesomeIcons.arrowLeft,
              size: screenWidth * 0.045,
            )),
        title: ReusableText(
            weight: FontWeight.w600,
            fontSize: screenWidth * 0.04,
            lbl: 'Appointment'),
      ),
      backgroundColor: themeLightColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: screenHeight * 0.025),
              height: screenHeight * 0.22,
              color: Colors.white,
              child: const CalendarWidget(title: 'Set Your Day'),
            ),
            TimeTitle(
              screenWidth: screenWidth,
              title: 'Morning Slots',
              topPadding: screenHeight * 0.022,
              bottomPadding: screenHeight * 0.015,
            ),
            TimeSlotsRow(
              screenWidth: screenWidth,
              loopStartNumber: 0,
              loopEndNumber: 3,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              screenHeight: screenHeight,
            ),
            TimeTitle(
              screenWidth: screenWidth,
              title: 'Afternoon Slots',
              topPadding: screenHeight * 0.025,
              bottomPadding: screenHeight * 0.015,
            ),
            TimeSlotsRow(
              screenWidth: screenWidth,
              loopStartNumber: 3,
              loopEndNumber: 6,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              screenHeight: screenHeight,
            ),
            const SizedBox(
              height: 2.5,
            ),
            TimeSlotsRow(
              screenWidth: screenWidth,
              loopStartNumber: 6,
              loopEndNumber: 7,
              wantSpace: true,
              screenHeight: screenHeight,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            TimeTitle(
              screenWidth: screenWidth,
              title: 'Evening Slots',
              topPadding: screenHeight * 0.025,
              bottomPadding: screenHeight * 0.015,
            ),
            TimeSlotsRow(
              screenWidth: screenWidth,
              loopStartNumber: 8,
              loopEndNumber: 11,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              screenHeight: screenHeight,
            ),
            const SizedBox(
              height: 2.5,
            ),
            TimeSlotsRow(
              screenWidth: screenWidth,
              loopStartNumber: 11,
              loopEndNumber: 12,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              screenHeight: screenHeight,
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            CustomBtn(
                btnHeight: screenHeight * 0.055,
                btnWidth: screenWidth * 0.7,
                onTapFunction: () {
                  saveSlot(getTimeController.time.value);
                  saveDate(getDateController.date.value);
                  saveDay(getDateController.day.value);
                  Get.to(
                      SaveAddressScreen(
                          screenWidth: screenWidth, screenHeight: screenHeight),
                      transition: Transition.fadeIn);
                },
                txtWeight: FontWeight.w600,
                txtFontSize: screenWidth * 0.035,
                lbl: 'Book Appointment',
                clr: themeColor,
                txtColor: Colors.black)
          ],
        ),
      ),
    );
  }
}
