import 'package:eduscan_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPress,
    required this.title,
    this.colortext,
    this.backgroundColor,
  });
  final void Function()? onPress;
  final String title;
  final Color? colortext;
  final Color? backgroundColor;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        //  backgroundColor: backgroundColor ?? primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        minimumSize: Size(331.w, 51.h),
        backgroundColor: backgroundColor ?? secondColor, // Default color
      ),
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15.sp,
          color: colortext ?? Colors.white, // Changed to colortext variable
        ),
      ),
    );
  }
}
