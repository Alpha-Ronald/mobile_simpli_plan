import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

////this button is used through the app, and not just for the authentication screens
class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;
  final Color borderColor;
  final double width;
  final double height;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor = Colors.blue, // Default primary color
    this.borderColor = Colors.transparent, // Default no border
    this.width = 358,
    this.height = 54,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: BorderSide(color: borderColor, width: 1),
          ),
          // padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h), // Adjust spacing
        ),
        child: child,
      ),
    );
  }
}

