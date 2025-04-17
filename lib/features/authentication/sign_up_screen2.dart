import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_background.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';


class SignUpScreen2 extends ConsumerWidget {
  SignUpScreen2({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
                    onTap: (){ Navigator.pushNamed(context, "/resetPassword1");},
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
              padding:  EdgeInsets.only(left:16.0.w,right: 16.w),
              child: CustomButton(
                onPressed: (){},
                backgroundColor: const Color(0xFF001233),
                child:Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),

            SizedBox(height: 24.h),
            //
            // Padding(
            //   padding:EdgeInsets.only(left: 16.w, right:16.w),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Divider(
            //           color: Colors.grey[300], // Adjust color as needed
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 8.w),
            //         child: Text(
            //           "Or",
            //           style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
            //         ),
            //       ),
            //       Expanded(
            //         child: Divider(
            //           color: Colors.grey[300], // Adjust color as needed
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            //
            // SizedBox(height: 30.h),
            // Align(
            //   alignment: Alignment.center,
            //   child: GestureDetector(
            //     onTap: () {     Navigator.pushNamed(context, "/signup");
            //     },
            //     child: Text(
            //       "Already have an account? ",
            //       style: TextStyle(fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w400),
            //
            //     ),
            //
            //   ),
            // ),
            // SizedBox(height: 20.h),
            //
            // Padding(
            //   padding:  EdgeInsets.only(left:16.0.w,right: 16.w),
            //   child: CustomButton(
            //     onPressed: () {
            //       // Handle Google sign-up logic here
            //     },
            //     backgroundColor: Colors.white,
            //     borderColor: const Color(0xFFFFBF00),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Icon(Icons.g_translate, color: Colors.black),
            //         SizedBox(width: 8.w),
            //         Text(
            //           "Login",
            //           style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}
