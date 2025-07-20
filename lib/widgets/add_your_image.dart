// lib/widgets/add_your_image.dart
// ignore_for_file: sort_child_properties_last, avoid_print

import 'dart:io';
import 'package:eduscan_app/helper/user_image_notifier.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddYourImage extends StatelessWidget {
  const AddYourImage({super.key});

  Future<void> pickImage() async {
    try {
      final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedImage != null) {
        userImageNotifier.value = File(pickedImage.path);
      }
    } catch (e) {
      print('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickImage,
      child: ValueListenableBuilder<File?>(
        valueListenable: userImageNotifier,
        builder: (context, image, _) {
          return CircleAvatar(
            radius: 40,
            backgroundImage: image != null ? FileImage(image) : null,
            child: image == null
                ? const Icon(Icons.person, size: 40, color: Colors.white)
                : null,
            backgroundColor: Colors.grey[300],
          );
        },
      ),
    );
  }
}
