// audio_screen.dart
import 'package:flutter/material.dart';
import 'package:multimedia/bottom_navigation.dart';

class AudioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multimedia"), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Llista de cançons"),
          ElevatedButton(
            onPressed: () {},
            child: Text("Pausar"),
          ),
          Slider(value: 0.5, onChanged: (value) {}),
        ],
      ),
    );
  }
}