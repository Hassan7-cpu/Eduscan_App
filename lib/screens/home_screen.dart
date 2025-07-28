import 'dart:io';
import 'package:eduscan_app/constant.dart';
import 'package:eduscan_app/helper/chat_room-ai.dart';
import 'package:eduscan_app/screens/camera.dart';
import 'package:eduscan_app/screens/camra_screen.dart';
import 'package:eduscan_app/screens/chat_ai.dart';
import 'package:eduscan_app/screens/chat_screen.dart';
import 'package:eduscan_app/screens/profile_screen.dart';
import 'package:eduscan_app/widgets/home_contect.dart';
import 'package:flutter/material.dart';
import 'package:eduscan_app/screens/image_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  File? imageFile;

  void updateImage(File file) {
    setState(() {
      imageFile = file;
      currentIndex = 1; // الكاميرا
    });
  }

  final List<Widget> pages = [];

  @override
  Widget build(BuildContext context) {
    final List<Widget> pageList = [
      const HomeContect(),
      const Camera(),
      const ChatScreen(),
      ChatRoomDrawer(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: pageList[currentIndex],
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            currentIndex: currentIndex,
            backgroundColor: Color(0XFFDADADA),
            selectedItemColor: secondColor,
            unselectedItemColor: Color(0XFF9E9E9E),
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.camera_enhance_rounded),
                label: 'Camera',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_sharp),
                label: 'Chat AI',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: 'Profile',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
