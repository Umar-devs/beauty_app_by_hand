import 'package:beauty_app_by_hand/Controller/Appointment%20Controllers/get_date_controller.dart';
import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:beauty_app_by_hand/View/Pages/Book%20Appointment/Components/Widgets/title_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// Custom Calender in row Style


class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key, required this.title});
  final String title;
  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  int tappedIndex = -1;
  late String currentSelectedMonth = '';
final GetDateController getDateController=Get.put(GetDateController());
  @override
  Widget build(BuildContext context) {
    final double screenWidth=MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: screenWidth*0.05),
          child: CalendarTitleRow(
            label: widget.title,
            currentMonth:
            tappedIndex == -1 ? 'month' : currentSelectedMonth.toString(),
          ),
        ),
        SizedBox(
          height: screenWidth * 0.18,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              bool isTapped = index == tappedIndex;
// Separator widget with date
              DateTime currentDate = DateTime.now().add(Duration(days: index));
              String formattedDate = DateFormat('dd').format(currentDate);
              String selectedMonth = DateFormat('MMMM').format(currentDate);
              String selectedYear=DateFormat('yyyy').format(currentDate);
              String dayName = getDayName(currentDate);
              // List<String> daysOfWeek = getDaysOfWeek(currentDate);
              void changeMonth() {
                setState(() {
                  currentSelectedMonth = selectedMonth;
                });
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: () {
                    getDateController.getDateDay('$formattedDate $selectedMonth $selectedYear', dayName);
                    setState(() {
                      tappedIndex = index;
                      changeMonth();
                    });
                  },
                  child: Container(
                    height: 20,
                    width: screenWidth * 0.1,
                    decoration: isTapped
                        ? BoxDecoration(
                        gradient:  LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xffebc1a9).withOpacity(0.5),
                              const Color(0xffebc1a9).withOpacity(0.5),
                            ]),
                        borderRadius: BorderRadius.circular(screenWidth * 0.01))
                        : BoxDecoration(
                        color: themeLightColor,
                        borderRadius: BorderRadius.circular(screenWidth * 0.01)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            formattedDate,
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color:  Colors.black,
                              fontWeight:
                              isTapped ? FontWeight.w600 : FontWeight.w300,
                            ),
                          ),
                          Text(
                            dayName,
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              color:  Colors.black,
                              fontWeight:
                              isTapped ? FontWeight.w800 : FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount:
            365, // Replace with the actual number of items in your list
          ),
        ),
      ],
    );
  }

  String getDayName(DateTime date) {
    return DateFormat.E().format(date);
  }
}




