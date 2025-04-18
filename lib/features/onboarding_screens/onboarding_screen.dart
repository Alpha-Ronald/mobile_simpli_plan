import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../authentication/sign_up_screen1.dart';
import '../widgets/onboarding_screen_structure.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}
class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  int currentIndex = 0;

  final pages = const [
    OnboardingPage(
      imagePath: 'assets/images/onboarding1.png',
      title: 'Stay on top of your work.',
      description:
      'Set up meetings, classes, or events. Customize details like time, location, and descriptions to suit your needs.',
    ),
    OnboardingPage(
      imagePath: 'assets/images/onboarding2.png',
      title: 'Get organized.',
      description:
      'Stay organized with a clear overview of all your upcoming events. Easily edit or update details whenever you need.',
    ),
    OnboardingPage(
      imagePath: 'assets/images/onboarding3.png',
      title: 'Receive reminders.',
      description:
      'Stay on top of your schedule with timely reminders so you never miss anything important.',
    ),
  ];

  void skipToEnd() {
    controller.animateToPage(
      pages.length - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void goNext() {
    if (currentIndex < pages.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>SignUpScreen1()));
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E4053),
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: pages,
            ),
            Positioned(
              top: 20.h,
              right: 20.w,
              child: currentIndex < pages.length - 1
                  ? GestureDetector(
                onTap: skipToEnd,
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    decoration: TextDecoration.none,
                  ),
                ),
              )
                  : const SizedBox(),
            ),
            Positioned(
              bottom: 60.h,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: pages.length,
                    effect: WormEffect(
                      dotHeight: 10.h,
                      dotWidth: 10.w,
                      spacing: 12.w,
                      activeDotColor: Colors.white,
                      dotColor: Colors.white24,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  GestureDetector(
                    onTap: goNext,
                    child: Center(
                      child: Container(
                        width: 55.w,
                        height: 55.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black38
                          //border: Border.all(color: Colors.black, width: 3),
                        ),
                        child:Center(
                          child: Container(
                            width: 30.w,
                            height: 30.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              //border: Border.all(color: Colors.black, width: 3),
                            ),
                            //child: const Icon(Icons.arrow_forward, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
