// ignore_for_file: file_names, body_might_complete_normally_nullable

import 'package:eduscan_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hinttext,
    this.suffixIcon,
    this.isPassword,
    this.prefixIcon,
  });
  final String hinttext;
  final Widget? suffixIcon;
  final bool? isPassword;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 331.w,
      height: 60.h,
      child: TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'this field is required';
          }
        },

        obscureText: isPassword ?? false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: kprimaryColor, width: 1.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: kprimaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: secondColor, width: 1.w),
            // borderSide: BorderSide(color: ),
          ),
          hintText: hinttext,
          hintStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            // ignore: use_full_hex_values_for_flutter_colors
            color: Color(0XFFC2C3CB),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 12.h,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: kprimaryColor, // Added this
        ),
      ),
    );
  }
}
