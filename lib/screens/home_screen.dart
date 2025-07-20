import 'package:eduscan_app/constant.dart';
import 'package:eduscan_app/screens/camra_screen.dart';
import 'package:eduscan_app/screens/chat_screen.dart';
import 'package:eduscan_app/widgets/home_contect.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> pages = const [
    HomeContect(),
    CameraCaptureScreen(),
    ChatScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 60,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          BottomNavigationBar(
            currentIndex: currentIndex,
            backgroundColor: Colors.transparent,
            selectedItemColor: secondColor,
            unselectedItemColor: Colors.white70,
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
            ],
          ),
        ],
      ),
    );
  }
}
