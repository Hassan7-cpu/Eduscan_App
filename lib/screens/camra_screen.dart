// ignore_for_file: avoid_print, unused_import

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:eduscan_app/screens/image_screen.dart';
import 'package:flutter/material.dart';

class CameraCaptureScreen extends StatefulWidget {
  const CameraCaptureScreen({super.key});

  @override
  State<CameraCaptureScreen> createState() => _CameraCapturePageState();
}

class _CameraCapturePageState extends State<CameraCaptureScreen> {
  CameraController? cameraController;
  Future<void>? initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    cameraController = CameraController(firstCamera, ResolutionPreset.medium);

    initializeControllerFuture = cameraController!.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      await initializeControllerFuture;
      final image = await cameraController!.takePicture();

      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageDisplayPage(imagePath: image.path),
        ),
      );
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (initializeControllerFuture == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('التقاط صورة')),
      body: Column(
        children: [
          FutureBuilder(
            future: initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(cameraController!);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: _takePicture,
          child: Center(child: const Icon(Icons.camera_alt_sharp)),
        ),
      ),
    );
  }
}
