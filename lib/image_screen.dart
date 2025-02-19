// image_screen.dart
import 'package:flutter/material.dart';
import 'dart:io';
import 'image_storage.dart';
import 'bottom_navigation.dart';

class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  List<String> _photoPaths = [];

  @override
  void initState() {
    super.initState();
    loadPhotos();
  }

  Future<void> loadPhotos() async {
    List<String>? imagePaths = await ImageStorage.loadPhotos();
    setState(() {
      _photoPaths = imagePaths ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fotos"), centerTitle: true),
      body: _photoPaths.isEmpty
    ? Center(child: Text("No hi ha imatges capturades"))
    : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Número de imágenes por fila
          crossAxisSpacing: 5, // Espaciado horizontal
          mainAxisSpacing: 5, // Espaciado vertical
        ),
        itemCount: _photoPaths.length,
        itemBuilder: (context, index) {
          return Image.file(File(_photoPaths[index]), fit: BoxFit.cover);
        },
            ),
      bottomNavigationBar: BottomNavigation(currentIndex: 1, cameras: []),
    );
  }
}
