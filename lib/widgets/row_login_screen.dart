import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowLoginScreen extends StatelessWidget {
  const RowLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already You Have An Account?',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Color(0XFFACADB9), // Changed to secondColor variable
          ),
        ),
        SizedBox(width: 5.w),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'signin');
          },
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black, // Changed to primaryColor variable
            ),
          ),
        ),
      ],
    );
  }
}
