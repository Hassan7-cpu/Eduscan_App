// ignore: unused_import
import 'package:eduscan_app/constant.dart';
import 'package:eduscan_app/widgets/custom_button.dart';
import 'package:eduscan_app/widgets/custom_text-form-field.dart';
import 'package:eduscan_app/widgets/row_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyLoginScreen extends StatefulWidget {
  const BodyLoginScreen({super.key});

  @override
  State<BodyLoginScreen> createState() => _BodyLoginViewState();
}

class _BodyLoginViewState extends State<BodyLoginScreen> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidate = AutovalidateMode.disabled;
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidate, // لتفعيل التحقق تلقائيًا بعد الضغط
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Text(
              'Create Your Account',
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            SizedBox(height: 50.h),
            CustomTextFormField(
              prefixIcon: Icon(Icons.person),
              hinttext: 'Full Name',
            ),
            SizedBox(height: 5.h),
            CustomTextFormField(
              prefixIcon: Icon(Icons.email),
              hinttext: 'Enter your Email',
            ),
            SizedBox(height: 5.h),
            CustomTextFormField(
              prefixIcon: Icon(Icons.lock),
              hinttext: 'Password',
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
              title: 'Login',
            ),
            SizedBox(height: 20.h),
            RowLoginScreen(),
          ],
        ),
      ),
    );
  }
}
