// main.dart
import 'package:flutter/material.dart'; // Importamos la librería de Flutter para la interfaz gráfica
import 'package:camera/camera.dart'; // Importamos la librería para manejar la cámara
import 'camera_screen.dart'; // Importamos la pantalla donde se usará la cámara

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Aseguramos la inicialización de Flutter antes de ejecutar código asíncrono
  final cameras = await availableCameras(); // Obtenemos la lista de cámaras disponibles en el dispositivo
  runApp(MyApp(cameras: cameras)); // Ejecutamos la aplicación y pasamos la lista de cámaras
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras; // Lista de cámaras disponibles en el dispositivo

  MyApp({required this.cameras}); // Constructor que recibe la lista de cámaras

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Ocultamos la etiqueta de "debug" en la esquina superior derecha
      home: CameraScreen(cameras: cameras), // Definimos la pantalla principal de la aplicación como CameraScreen
    );
  }
}
