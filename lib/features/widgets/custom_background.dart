import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_simpli_plan/theme/colors.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  final String mainText;
  final String? subText;
  const CustomBackground({super.key, required this.child, required this.mainText,
    this.subText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Large Background Circle (Partially Visible)
          Positioned(
            top: 115.h,
            left: -45.w,
            child: Container(
              width: 114.w,
              height: 114.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.backgroundColor,//Colors.white, // White background
                border: Border.all(
                  color: const Color(0xFFFFBF00),// Border color
                  width: 1.w, // Border width
                ),
              ),
            ),
          ),

          // Second Partial Circle (Lower Opacity)
          Positioned(
            top: 115.h,
            left: -40.w,
            child: Container(
              width: 94.w,
              height: 94.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.backgroundColor,//Colors.white, // White background
                border: Border.all(
                  color: const Color(0xFFFFBF00), // Border color
                  width: 1.w, // Border width
                ),
              ),
            ),
          ),


          // Small Dark Circle (Fully Visible)
          Positioned(
            top: 110.h,
            left: 40.w,
            child: Container(
              width: 22.w,
              height: 22.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white//const Color(0xFF001233), // Dark color
              ),
            ),
          ),

          //Color(0xFF2D2D2D)
          // Main Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20.h, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 24.w.h),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                  // Text Stack with Circles
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, top: 57.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mainText,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        if (subText != null) // Only show if provided
                          Text(
                            subText!,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                      ],
                    ),
                  ),

                  // Screen Content
                  SizedBox(height: 20.h),
                  Expanded(child: child), // The main screen content
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
