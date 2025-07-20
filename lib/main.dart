// ignore_for_file: unused_import

import 'package:eduscan_app/screens/home_screen.dart';
import 'package:eduscan_app/screens/login_screen.dart' show LoginView;
import 'package:eduscan_app/screens/signin_screen.dart';
import 'package:eduscan_app/theme_data.dart';
import 'package:eduscan_app/widgets/inttoduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

ValueNotifier<bool> themeNotifier = ValueNotifier<bool>(true);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ValueListenableBuilder(
          valueListenable: themeNotifier,
          builder: (context, isDark, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
              routes: {
                'homescreen': (context) => const HomeScreen(),
                'signin': (context) => const SigninScreen(),
                'login': (context) => const LoginView(),
                'inoduction_screen': (context) => IntoductionScreen(),
              },
              home: const IntoductionScreen(),
            );
          },
        );
      },
    );
  }
}
