import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class calendarPage extends StatefulWidget {
  const calendarPage({super.key});

  @override
  State<calendarPage> createState() => _calendarPageState();
}

class _calendarPageState extends State<calendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10)),
        TableCalendar(
          firstDay: DateTime(2022),
          lastDay: DateTime(3000),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          startingDayOfWeek: StartingDayOfWeek.sunday,
          rowHeight: 60,
          daysOfWeekHeight: 60,
          headerStyle: HeaderStyle(
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            formatButtonTextStyle: const TextStyle(color: Colors.black),
            formatButtonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 2),
            ),
            leftChevronIcon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 28,
            ),
            rightChevronIcon: const Icon(
              Icons.arrow_forward,
              color: Colors.black,
              size: 28,
            ),
          ),
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekendStyle: TextStyle(color: Colors.red),
          ),
          calendarStyle: const CalendarStyle(
            weekendTextStyle: TextStyle(color: Colors.red),
            todayDecoration: BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.teal,
              shape: BoxShape.circle,
            ),
          ),
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(
                () {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                },
              );
            }
          },
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(
                () {
                  _calendarFormat = format;
                },
              );
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        colorBar(),
      ],
    );
  }

  Widget colorBar() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        const Padding(padding: EdgeInsets.fromLTRB(100, 0, 0, 0)),
        Container(
          width: 370,
          // height: 100,
          child: Container(
            child: SfLinearGauge(
              minimum: 0,
              maximum: 500,
              ranges: const <LinearGaugeRange>[
                LinearGaugeRange(
                    startValue: 0, endValue: 50, color: Color(0xFF00B050)),
                LinearGaugeRange(
                    startValue: 51, endValue: 100, color: Color(0xFF669900)),
                LinearGaugeRange(
                    startValue: 101, endValue: 200, color: Color(0xFFE5B8B7)),
                LinearGaugeRange(
                    startValue: 201, endValue: 300, color: Color(0xFFFFC000)),
                LinearGaugeRange(
                    startValue: 301, endValue: 400, color: Color(0xFFFF0000)),
                LinearGaugeRange(
                    startValue: 401, endValue: 500, color: Color(0xFFC00000))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
