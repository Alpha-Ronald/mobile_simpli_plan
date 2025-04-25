
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SemesterTable extends StatelessWidget {
  final String semesterTitle;
  final List<Map<String, String>> courses;
  final VoidCallback onAddCourse;

  const SemesterTable({
    super.key,
    required this.semesterTitle,
    required this.courses,
    required this.onAddCourse,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            semesterTitle,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12.h),
          Table(
            border: TableBorder.all(color: Colors.grey.shade400),
            columnWidths: const {
              0: FixedColumnWidth(40),
              1: FlexColumnWidth(),
              2: FlexColumnWidth(),
              3: FlexColumnWidth(),
            },
            children: [
              // Table Header
              TableRow(
                decoration: BoxDecoration(color: Colors.blueGrey.shade700),
                children: [
                  tableCell("No.", isHeader: true),
                  tableCell("Course Code", isHeader: true),
                  tableCell("Course Title", isHeader: true),
                  tableCell("Status", isHeader: true),
                  tableCell("Units", isHeader: true),
                ],
              ),
              // Table Body
              ...courses.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, String> course = entry.value;
                return TableRow(
                  children: [
                    tableCell("${index + 1}"),
                    tableCell(course['code'] ?? ''),
                    tableCell(course['title'] ?? ''),
                    tableCell(course['status'] ?? ''),
                    tableCell(course['units'] ?? '')
                  ],
                );
              }).toList(),
            ],
          ),
          SizedBox(height: 8.h),
          GestureDetector(
            onTap: onAddCourse,
            child: Row(
              children: [
                const Icon(Icons.add, color: Colors.white),
                SizedBox(width: 8.w),
                Text(
                  "Add Course",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget tableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
