import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../users/account_setup_screen.dart';
import '../widgets/custom_background.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/onboarding_screen_structure.dart';

class SignUpScreen2 extends ConsumerWidget {
  SignUpScreen2({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomBackground(
      mainText: "Complete Sign Up",
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Email",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
            ),

            SizedBox(height: 15.h),
            CustomTextField(
              label: "Email",
              controller: emailController,
              keyboardType: TextInputType.text,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Password",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 15.h),
            CustomTextField(
              label: "password",
              controller: passwordController,
              isPassword: true,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Confirm Password",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 15.h),
            CustomTextField(
              label: "Confirm password",
              controller: confirmPasswordController,
              isPassword: true,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0.w, right: 16.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/resetPassword1");
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    )),
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.only(left: 16.0.w, right: 16.w),
              child: CustomButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                height: 130.h,
                                child: Image.asset('assets/images/account_successful_image.webp')),
                            SizedBox(height: 16.0),
                            Text(
                              "Account created successfully",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CustomButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>AccountSetupScreen()),
                                  );
                                },
                                backgroundColor: Colors.white,
                                borderColor: const Color(0xFFFFBF00),
                                child: Text(
                                  "Proceed to Account Setup",
                                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                backgroundColor: const Color(0xFF001233),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
