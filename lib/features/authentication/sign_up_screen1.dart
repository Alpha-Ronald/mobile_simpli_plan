import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_simpli_plan/features/authentication/sign_up_screen2.dart';

import '../widgets/custom_background.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'login_screen.dart';


class SignUpScreen1 extends ConsumerWidget {
  SignUpScreen1({super.key});

  final TextEditingController matricNumberController = TextEditingController();
  final TextEditingController programController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return CustomBackground(
      mainText: "Register your account",
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Matric Number",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 15.h),
            CustomTextField(
              label: "Matric Number",
              controller: matricNumberController,
              keyboardType: TextInputType.text,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Program",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 15.h),
            CustomTextField(
              label: "Program",
              controller: programController,
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 16.0.w, right: 16.w),
            //   child: Align(
            //     alignment: Alignment.centerRight,
            //     child: GestureDetector(
            //         onTap: (){ Navigator.pushNamed(context, "/resetPassword1");},
            //         child: Text(
            //           'Forgot Password?',
            //           style: TextStyle(
            //               color: Colors.black,
            //               fontWeight: FontWeight.w500,
            //               fontSize: 14.sp),
            //         )),
            //   ),
            // ),
            SizedBox(height: 24.h),
            Padding(
              padding:  EdgeInsets.only(left:16.0.w,right: 16.w),
              child: CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>SignUpScreen2()),
                  );
                },
                backgroundColor: const Color(0xFF001233),
                child:Text(
                  "Continue",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),

            SizedBox(height: 24.h),

            Padding(
              padding:EdgeInsets.only(left: 16.w, right:16.w),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey[300], // Adjust color as needed
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      "Or",
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey[300], // Adjust color as needed
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.h),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {     Navigator.pushNamed(context, "/signup");
                },
                child: Text(
                     "Already have an account? ",
                    style: TextStyle(fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w400),

                  ),

              ),
            ),
            SizedBox(height: 20.h),

            Padding(
              padding:  EdgeInsets.only(left:16.0.w,right: 16.w),
              child: CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>LoginScreen()),
                  );
                },
                backgroundColor: Colors.white,
                borderColor: const Color(0xFFFFBF00),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.g_translate, color: Colors.black),
                    SizedBox(width: 8.w),
                    Text(
                      "Login",
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
