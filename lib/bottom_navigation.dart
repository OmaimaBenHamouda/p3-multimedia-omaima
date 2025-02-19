
// bottom_navigation.dart
import 'package:flutter/material.dart';
import 'camera_screen.dart';
import 'image_screen.dart';
import 'audio_screen.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  BottomNavigation({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => CameraScreen(cameras: [])));
        } else if (index == 1) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ImageScreen()));
        } else if (index == 2) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AudioScreen()));
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Càmera"),
        BottomNavigationBarItem(icon: Icon(Icons.image), label: "Foto"),
        BottomNavigationBarItem(icon: Icon(Icons.audiotrack), label: "Multimedia"),
      ],
    );
  }
}
