// camera_screen.dart
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:multimedia/image_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottom_navigation.dart';
import 'image_screen.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraScreen({Key? key, required this.cameras}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  bool _isRearCamera = true; // Indica si se usa la cámara trasera
  bool _isFlashOn = false; // Indica si el flash está activado
  String? _lastPhotoPath; // Almacena la última foto tomada

  @override
  void initState() {
    super.initState();
    initializeCamera(); // Inicializa la cámara al iniciar el widget
  }

  Future<void> initializeCamera() async {
    // Configura el controlador de la cámara con la cámara seleccionada
    _controller = CameraController(
      _isRearCamera ? widget.cameras[0] : widget.cameras[1],
      ResolutionPreset.medium,
    );
    await _controller!.initialize(); // Inicializa la cámara
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> capturePhoto() async {
    if (_controller == null || !_controller!.value.isInitialized) return;
    final directory = await getApplicationDocumentsDirectory(); // Obtiene el directorio de almacenamiento
    final imagePath = '${directory.path}/${DateTime.now()}.png';

    await _controller!.takePicture().then((XFile file) {
      file.saveTo(imagePath); // Guarda la foto en la ruta especificada
      setState(() {
        _lastPhotoPath = imagePath; // Actualiza la última foto tomada
      });

      // Guarda la imagen en la lista de almacenamiento
      ImageStorage.savePhoto(imagePath);

      // Muestra un popup de confirmación
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Foto Capturada"),
          content: Text("Se ha guardado en: $imagePath"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        ),
      );
    });
  }

  Future<void> saveLastPhoto(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_photo', path); // Guarda la última foto en SharedPreferences
  }

  @override
  void dispose() {
    print("Cámara detenida");
    _controller?.dispose(); // Libera los recursos de la cámara
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_controller == null) {
      initializeCamera();  // 🔹 Reinicializa la cámara si no está disponible
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cámara"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(_isFlashOn ? Icons.flash_on : Icons.flash_off),
            onPressed: () {
              setState(() {
                _isFlashOn = !_isFlashOn; // Alterna el estado del flash
                _controller?.setFlashMode(
                    _isFlashOn ? FlashMode.torch : FlashMode.off);
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.switch_camera),
            onPressed: () {
              setState(() {
                _isRearCamera = !_isRearCamera; // Cambia entre cámara trasera y frontal
                initializeCamera(); // Reinicializa la cámara con la nueva configuración
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _controller == null || !_controller!.value.isInitialized
                ? Center(child: CircularProgressIndicator()) // Muestra un indicador de carga si la cámara no está lista
                : CameraPreview(_controller!), // Muestra la vista previa de la cámara
          ),
          IconButton(
            icon: Icon(Icons.camera_alt, size: 50, color: Colors.blue),
            onPressed: capturePhoto, // Captura la foto al presionar el botón
          ),
          if (_lastPhotoPath != null)
            Image.file(File(_lastPhotoPath!), height: 100), // Muestra la última foto tomada
          BottomNavigation(currentIndex: 0, cameras: widget.cameras), // Barra de navegación inferior
        ],
      ),
    );
  }
}
