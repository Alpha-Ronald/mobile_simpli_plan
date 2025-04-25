import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Custom TextField widget used across the app.
class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final double? height;
  final double? width;
  final Color? fillColor;      // Background color
  final Color? textColor;      // Input text color
  final double? fontSize;      // Input text size

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.height,
    this.width,
    this.fillColor,
    this.textColor,
    this.fontSize,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
      child: SizedBox(
        width: widget.width ?? 358.w,
        height: widget.height ?? 72.h,
        child: TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? _obscureText : false,
          maxLines: (widget.height != null && widget.height! > 72.h) ? null : 1,
          style: TextStyle(
            color: widget.textColor ?? Colors.black,      // Text color
            fontSize: widget.fontSize ?? 16.sp,            // Text size
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillColor ?? Colors.white70,
            labelText: widget.label,
            labelStyle: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Colors.black),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: widget.height != null
                  ? widget.height! * 0.25   // Dynamic padding based on height
                  : 24.h,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey.shade600,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
                : null,
          ),
        ),
      ),
    );
  }
}
