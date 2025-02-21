// image_screen.dart
import 'package:flutter/material.dart';
import 'dart:io';
import 'image_storage.dart';
import 'bottom_navigation.dart';

// Pantalla de imágenes que muestra las fotos guardadas
class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  List<String> _photoPaths = []; // Lista para almacenar las rutas de las imágenes

  @override
  void initState() {
    super.initState();
    loadPhotos(); // Cargar las fotos al iniciar la pantalla
  }

  // Método para cargar las fotos desde el almacenamiento
  Future<void> loadPhotos() async {
    List<String>? imagePaths = await ImageStorage.loadPhotos();
    setState(() {
      _photoPaths = imagePaths ?? []; // Asigna las rutas obtenidas o una lista vacía si es nula
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fotos"), // Título de la pantalla
        centerTitle: true, // Centrar el título en la barra de navegación
      ),
      body: _photoPaths.isEmpty
        ? Center(child: Text("No hi ha imatges capturades")) // Mensaje si no hay imágenes
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Número de imágenes por fila
              crossAxisSpacing: 5, // Espaciado horizontal
              mainAxisSpacing: 5, // Espaciado vertical
            ),
            itemCount: _photoPaths.length, // Número total de imágenes
            itemBuilder: (context, index) {
              return Image.file(
                File(_photoPaths[index]), // Cargar la imagen desde el archivo
                fit: BoxFit.cover, // Ajustar la imagen al contenedor
              );
            },
          ),
      bottomNavigationBar: BottomNavigation(currentIndex: 1, cameras: []), // Barra de navegación inferior
    );
  }
}
