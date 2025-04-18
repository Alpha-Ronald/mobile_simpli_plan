import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2E4053),
      width: double.infinity,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: 50.h),
          Stack(

            children: [
              Center(
                child: Image.asset(
                  'assets/images/onboardingbackground.png',
                  height: 330.h,
                  fit: BoxFit.contain,

                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.w),
                child: Center(
                  child: Image.asset(
                  imagePath,
                  height: 260.h,
                  fit: BoxFit.contain,
                              ),
                ),
              ),

            ]
          ),

          SizedBox(height: 20.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15.sp,
                color: Colors.white.withOpacity(0.8),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
