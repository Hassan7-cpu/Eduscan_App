import 'package:eduscan_app/widgets/body_login_screen.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: SingleChildScrollView(child: BodyLoginScreen())),
    );
  }
}
