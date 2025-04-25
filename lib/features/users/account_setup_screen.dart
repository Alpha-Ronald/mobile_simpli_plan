import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_simpli_plan/features/authentication/sign_up_screen1.dart';
import 'package:mobile_simpli_plan/features/authentication/sign_up_screen2.dart';
import 'package:mobile_simpli_plan/features/users/home_screen.dart';

import '../widgets/custom_background.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_drop_down.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/semester_table.dart';


class AccountSetupScreen extends StatefulWidget{
  @override
  State<AccountSetupScreen> createState() => _AccountSetupScreenState();
}

class _AccountSetupScreenState extends State<AccountSetupScreen> {
  final TextEditingController matricNumberController = TextEditingController();
  String? selectedProgram;
  String? selectedLevel;

  final List<Map<String, String>> alphaCourses = [];
  final List<Map<String, String>> omegaCourses = [];

  final List<String> programs = [
    'Computer Science',
    'Software Engineering',
    'Cybersecurity',
  ];

  final List<String> levels = [
    '100 Level',
    '200 Level',
    '300 Level',
    '400 Level'
  ];



  final statusOptions = ['Compulsory', 'Elective'];

  void addCourse(List<Map<String, String>> courseList) {
    setState(() {
      courseList.add({
        'code': '',
        'title': '',
        'status': statusOptions.first,
        'units': '0',
      });
    });
  }

  Widget courseTable(String semester, List<Map<String, String>> courseList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$semester Semester Courses',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        DataTable(
          columns: const [
            DataColumn(label: Text('No.')),
            DataColumn(label: Text('Course Code')),
            DataColumn(label: Text('Course Title')),
            DataColumn(label: Text('Status')),
            DataColumn(label: Text('Units')),
          ],
          rows: [
            for (int i = 0; i < courseList.length; i++)
              DataRow(cells: [
                DataCell(Text('${i + 1}')),
                DataCell(TextFormField(
                  initialValue: courseList[i]['code'],
                  onChanged: (val) => courseList[i]['code'] = val,
                )),
                DataCell(TextFormField(
                  initialValue: courseList[i]['title'],
                  onChanged: (val) => courseList[i]['title'] = val,
                )),
                DataCell(DropdownButton<String>(
                  value: courseList[i]['status'],
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        courseList[i]['status'] = val;
                      });
                    }
                  },
                  items: statusOptions
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                )),
                DataCell(TextFormField(
                  initialValue: courseList[i]['units'],
                  keyboardType: TextInputType.number,
                  onChanged: (val) => courseList[i]['units'] = val,
                )),
              ]),
          ],
        ),
        TextButton.icon(
          onPressed: () => addCourse(courseList),
          icon: const Icon(Icons.add),
          label: const Text('Add Course'),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  void completeSetup() {
    // Validate + save to backend
    debugPrint('Program: $selectedProgram');
    debugPrint('Level: $selectedLevel');
    debugPrint('Alpha: $alphaCourses');
    debugPrint('Omega: $omegaCourses');
    // Proceed to dashboard
  }
  @override
  Widget build(BuildContext context) {
    return CustomBackground(mainText: "SETUP YOUR ACCOUNT",
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
              child: Text(
                "Matric Number",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
              ),
            ),
            CustomTextField(label:  'Matric Number', controller: matricNumberController,
            fillColor: Colors.transparent,
              textColor: Colors.white,
              fontSize: 18.sp,),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
              child: Text(
                "Program",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
              ),
            ),
            CustomDropdown<String>(
              fillColor: Colors.transparent,
              label: 'Program',
              value: selectedProgram,
              items: programs.map((program) {
                return DropdownMenuItem(
                  value: program,
                  child: Text(program),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedProgram = value!;
                });
              },
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
              child: Text(
                "Level",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
              ),
            ),
            CustomDropdown<String>(
              fillColor: Colors.transparent,
              label: 'Level',
              value: selectedLevel,
              items: levels.map((program) {
                return DropdownMenuItem(
                  value: program,
                  child: Text(program),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedLevel = value!;
                });
              },
            ),


            SemesterTable(
              semesterTitle: 'Alpha Semester',
              courses: [
                {'code': 'CSC101', 'title': 'Intro to Computer Science', 'status': 'Compulsory', },
                {'code': 'MTH101', 'title': 'Algebra', 'status': 'Elective'},
              ],
              onAddCourse: () {
                // logic to add new course
              },
            ),
            SemesterTable(
              semesterTitle: 'Omega Semester',
              courses: [
                {'code': 'CSC201', 'title': 'Intro to Computer Science', 'status': 'Compulsory', },
                {'code': 'MTH201', 'title': 'Algebra', 'status': 'Elective'},
              ],
              onAddCourse: () {
                // logic to add new course
              },
            ),

            // Omega Courses Table

            Center(
              child: CustomButton(
                backgroundColor: Colors.black12,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>HomeScreen()),
                  );
                },
                  child:  Text(
                    "Complete Setup",
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white),
                  ),)
            ),
            SizedBox(height: 20.h,)
          ],
        ),
      ),
    );
  }
}

