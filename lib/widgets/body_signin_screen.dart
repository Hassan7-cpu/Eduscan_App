import 'package:eduscan_app/constant.dart';
import 'package:eduscan_app/widgets/custom_button.dart';
import 'package:eduscan_app/widgets/custom_text-form-field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodySigninScreen extends StatefulWidget {
  const BodySigninScreen({super.key});

  @override
  State<BodySigninScreen> createState() => _BodySigninScreenState();
}

class _BodySigninScreenState extends State<BodySigninScreen> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidate = AutovalidateMode.disabled;
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100.h),
          Text(
            'SignUp Your Account',
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black, // Changed to secondColor variable
            ),
          ),
          SizedBox(height: 50.h),
          CustomTextFormField(
            prefixIcon: Icon(Icons.email),
            hinttext: 'Enter your Email',
          ),
          SizedBox(height: 5.h),
          CustomTextFormField(
            prefixIcon: Icon(Icons.lock),
            hinttext: 'password',
            isPassword: isPassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isPassword = !isPassword;
                });
              },
              icon: Icon(
                size: 20.sp,
                isPassword
                    ? Icons.remove_red_eye_outlined
                    : Icons.visibility_off,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          CustomButton(
            onPress: () {
              if (formKey.currentState!.validate()) {
                // الحقول مش فاضية
                autovalidate = AutovalidateMode.disabled;
                Navigator.pushNamed(context, 'homescreen');
              } else {
                // في حقل فاضي
                setState(() {
                  autovalidate = AutovalidateMode.always;
                });
              }
            },
            title: 'Sign In',
            backgroundColor: secondColor,
          ),
        ],
      ),
    );
  }
}
