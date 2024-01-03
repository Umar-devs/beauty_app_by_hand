import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeCalendarPage extends StatefulWidget {
  const HomeCalendarPage({super.key, this.pickUp = true});
  final bool pickUp;
  @override
  State<HomeCalendarPage> createState() => _HomeCalendarPageState();
}

class _HomeCalendarPageState extends State<HomeCalendarPage> {
  // CalendarController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = CalendarController();
  }

  DateTime _selectedDay = DateTime.utc(2023, 1, 1);
  DateTime _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.9,
      height: screenHeight * 0.27,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: TableCalendar(
          calendarFormat: CalendarFormat.twoWeeks,
          calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50)),
              selectedDecoration: const BoxDecoration(color: Colors.green),
              todayTextStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.04,
                  color: Colors.black)),
          headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenWidth*0.04,

            ),
            headerMargin: EdgeInsets.only(
                left: screenWidth * 0.1, right: screenWidth * 0.1,bottom: screenHeight*0.02),
            formatButtonDecoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(22.0),
            ),
            formatButtonTextStyle: const TextStyle(color: Colors.white),
            formatButtonShowsNext: false,
            formatButtonVisible: false,
          ),
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarBuilders: CalendarBuilders(
            selectedBuilder: (context, date, events) => Container(
                margin: const EdgeInsets.all(6.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color:  const Color(0xffd66986), borderRadius: BorderRadius.circular(50)),
                child: Text(
                  date.day.toString(),
                  style: const TextStyle(color: Colors.white),
                )),
            holidayBuilder: (context, date, events) => Container(
                margin: const EdgeInsets.all(5.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  date.day.toString(),
                  style: const TextStyle(color: Colors.white),
                )),
          ),
          focusedDay: _focusedDay,
          firstDay: DateTime.utc(2023, 1, 01),
          lastDay: DateTime.utc(2030, 1, 1),
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay; // update `_focusedDay` here as well

              if (kDebugMode) {
                print(_selectedDay.toString());
              }
            });
          },
        ),
      ),
    );
  }
}
