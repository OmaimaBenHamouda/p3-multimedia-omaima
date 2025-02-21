import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // 📸 Importar el paquete de cámaras
import 'camera_screen.dart';
import 'image_screen.dart';
import 'audio_screen.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final List<CameraDescription> cameras; // 🔹 Lista de cámaras disponibles

  BottomNavigation({required this.currentIndex, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // Índice actual de la barra de navegación
      onTap: (index) {
        // 📌 Control de navegación entre pantallas según el índice seleccionado
        if (index == 0) {
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(
              builder: (context) => CameraScreen(cameras: cameras) // 🔹 Pasar la lista de cámaras
            )
          );
        } else if (index == 1) {
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(builder: (context) => ImageScreen()) // 📷 Navegar a la pantalla de imágenes
          );
        } else if (index == 2) {
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(builder: (context) => AudioScreen()) // 🎵 Navegar a la pantalla de audio
          );
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Càmera"), // 📸 Opción de cámara
        BottomNavigationBarItem(icon: Icon(Icons.image), label: "Foto"), // 🖼 Opción de fotos
        BottomNavigationBarItem(icon: Icon(Icons.audiotrack), label: "Multimedia"), // 🎶 Opción de multimedia
      ],
    );
  }
}
