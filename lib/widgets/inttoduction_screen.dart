// ignore_for_file: unrelated_type_equality_checks

import 'package:eduscan_app/widgets/Screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntoductionScreen extends StatefulWidget {
  const IntoductionScreen({super.key});

  @override
  State<IntoductionScreen> createState() => _IntoductionScreenState();
}

class _IntoductionScreenState extends State<IntoductionScreen> {
  PageController controller = PageController();
  String buttonText = 'Skip';
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              currentPage = index;
              if (index == 2) {
                buttonText = 'Finish';
              } else {
                buttonText = 'Skip';
              }
              setState(() {});
            },
            children: [
              Screens(
                title: 'Unlock the power Of Future Ai',
                imagePath: 'assets/images/im1.jpg',
              ),
              Screens(
                title: 'Boost Your Mind power with Ai',
                imagePath: 'assets/images/im2.jpg',
              ),
              Screens(
                title: 'Chat With Your Favourite Ai',
                imagePath: 'assets/images/im3.jpg',
              ),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.8.r), // Center the indicator
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                  child: Text(
                    buttonText,
                    style: TextStyle(color: Color(0XFF8E9295)),
                  ),
                ),
                SmoothPageIndicator(controller: controller, count: 3),
                currentPage == 2
                    ? SizedBox(width: 10.w)
                    : TextButton(
                        onPressed: () {
                          controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(color: Color(0XFF8E9295)),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
