// lib/screens/home_contect.dart
import 'package:eduscan_app/constant.dart';
import 'package:eduscan_app/main.dart';
import 'package:eduscan_app/widgets/add_your_image.dart';
import 'package:eduscan_app/widgets/list_tile_drawer.dart';
import 'package:flutter/material.dart';

class HomeContect extends StatelessWidget {
  const HomeContect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: const Text("Home")),
    );
  }
}
