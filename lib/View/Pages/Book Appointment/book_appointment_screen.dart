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
  BookAppointmentScreen({super.key});
  final GetTimeController getTimeController = Get.put(GetTimeController());
  final GetDateController getDateController = Get.put(GetDateController());
  @override
  Widget build(BuildContext context) {
    final double width = screenWidth(context);
    final double height = screenHeight(context);
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
              size: width * 0.045,
            )),
        title: ReusableText(
            weight: FontWeight.w600,
            fontSize: width * 0.04,
            lbl: 'Appointment'),
      ),
      backgroundColor: themeLightColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: height * 0.025),
              height: height * 0.22,
              color: Colors.white,
              child: const CalendarWidget(title: 'Set Your Day'),
            ),
            TimeTitle(
              screenWidth: width,
              title: 'Morning Slots',
              topPadding: height * 0.022,
              bottomPadding: height * 0.015,
            ),
            TimeSlotsRow(
              screenWidth: width,
              loopStartNumber: 0,
              loopEndNumber: 3,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              screenHeight: height,
            ),
            TimeTitle(
              screenWidth: width,
              title: 'Afternoon Slots',
              topPadding: height * 0.025,
              bottomPadding: height * 0.015,
            ),
            TimeSlotsRow(
              screenWidth: width,
              loopStartNumber: 3,
              loopEndNumber: 6,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              screenHeight: height,
            ),
            const SizedBox(
              height: 2.5,
            ),
            TimeSlotsRow(
              screenWidth: width,
              loopStartNumber: 6,
              loopEndNumber: 7,
              wantSpace: true,
              screenHeight: height,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            TimeTitle(
              screenWidth: width,
              title: 'Evening Slots',
              topPadding: height * 0.025,
              bottomPadding: height * 0.015,
            ),
            TimeSlotsRow(
              screenWidth: width,
              loopStartNumber: 8,
              loopEndNumber: 11,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              screenHeight: height,
            ),
            const SizedBox(
              height: 2.5,
            ),
            TimeSlotsRow(
              screenWidth: width,
              loopStartNumber: 11,
              loopEndNumber: 12,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              screenHeight: height,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            CustomBtn(
                btnHeight: height * 0.055,
                btnWidth: width * 0.7,
                onTapFunction: () {
                  saveSlot(getTimeController.time.value);
                  saveDate(getDateController.date.value);
                  saveDay(getDateController.day.value);
                  Get.to(
                      SaveAddressScreen(
                          screenWidth: width, screenHeight: height),
                      transition: Transition.fadeIn);
                },
                txtWeight: FontWeight.w600,
                txtFontSize: width * 0.035,
                lbl: 'Book Appointment',
                clr: themeColor,
                txtColor: Colors.black)
          ],
        ),
      ),
    );
  }
}
