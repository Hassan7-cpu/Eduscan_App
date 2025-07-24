import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.title, this.icon, this.onPressed});
  final String title;
  final IconData? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 23.sp)),
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon, size: 23.sp),
          ),
        ],
      ),
    );
  }
}
