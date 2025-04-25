
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onChanged;
  final double? width;
  final double? height;
  final Color? fillColor;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.width,
    this.height,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
      child: SizedBox(
        width: width ?? 358.w,
        height: height ?? 72.h,
        child: InputDecorator(
          decoration: InputDecoration(
           // labelText: label,
           // labelStyle: TextStyle(fontSize: 14.sp, color: Colors.black),
            filled: true,
            fillColor: fillColor ?? Colors.white70,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              isExpanded: true,
              value: value,
              items: items,
              onChanged: onChanged,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
              icon:  Icon(Icons.keyboard_arrow_down_rounded, size: 20.sp,),
            ),
          ),
        ),
      ),
    );
  }
}
