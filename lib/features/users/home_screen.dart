import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/model/schedue_model.dart';
import '../widgets/schedule_event_card.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDate = DateTime.now();
  final List<ScheduleEvent> events = [
    ScheduleEvent(
      time: "9:00 AM",
      courseCode: "CS101",
      type: "Lecture",
      room: "Room 101",
      backgroundColor: Color(0xFF1C6E8C),
    ),
    ScheduleEvent(
      time: "11:00 AM",
      courseCode: "MATH201",
      type: "Lecture",
      room: "Room 203",
      backgroundColor: Color(0xFF276749),
    ),
    ScheduleEvent(
      time: "2:00 PM",
      courseCode: "ENG150",
      type: "Test",
      room: "Room 105",
      backgroundColor: Color(0xFFB7791F),
    ),
    ScheduleEvent(
      time: "4:00 PM",
      courseCode: "HIST301",
      type: "Lecture",
      room: "Room 302",
      backgroundColor: Color(0xFF742A2A),
    ),
    ScheduleEvent(
      time: "10:00 AM",
      courseCode: "CHEM110",
      type: "Lecture",
      room: "Lab 1",
      backgroundColor: Color(0xFF22543D),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.r),
                bottomRight: Radius.circular(25.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 3), // Shadow position
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      "Welcome, Adewoye",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "DU0858",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 28.sp,
                ),
              ],
            ),
          ),


SizedBox(height: 15.h,),
          DatePicker(
            DateTime.now(),
            height: 90.h,
            width: 50.w,
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.blue,
            selectedTextColor: Colors.white,
            dateTextStyle:
               TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),

            dayTextStyle:   TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),

            monthTextStyle:  TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),

            onDateChange: (date) {
              _selectedDate = date;
            },
          ),

          Padding(
            padding:  EdgeInsets.fromLTRB(16.w, 10.h,16.w, 12.h ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Today's Schedule",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

          ),
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return ScheduleEventCard(event: events[index]);
              },
            ),
          ),
SizedBox(height: 10.h,)
        ],
      ),
    );
  }
}
