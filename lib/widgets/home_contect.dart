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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                children: const [
                  AddYourImage(),
                  SizedBox(height: 8),
                  Text(
                    'Tap to change your photo',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTileDrawer(
              title: 'Sign out',
              iconData: Icons.exit_to_app,
              ontap: () {},
            ),
            ListTileDrawer(
              title: 'Change Theme',
              iconData: Icons.brightness_6,
              ontap: () {
                themeNotifier.value = !themeNotifier.value;
              },
            ),
            ListTileDrawer(
              title: 'Edit Profile',
              iconData: Icons.person,
              ontap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
