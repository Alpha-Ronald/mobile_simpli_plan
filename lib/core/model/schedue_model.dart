import 'dart:ui';

class ScheduleEvent {
  final String time;
  final String courseCode;
  final String type;
  final String room;
  final Color backgroundColor;

  ScheduleEvent({
    required this.time,
    required this.courseCode,
    required this.type,
    required this.room,
    required this.backgroundColor,
  });
}
