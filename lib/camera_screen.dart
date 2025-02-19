
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
  CameraScreen({required this.cameras});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  bool _isRearCamera = true;
  bool _isFlashOn = false;
  String? _lastPhotoPath;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    _controller = CameraController(
      _isRearCamera ? widget.cameras[0] : widget.cameras[1],
      ResolutionPreset.medium,
    );
    await _controller!.initialize();
    if (mounted) {
      setState(() {});
    }
  }

Future<void> capturePhoto() async {
  if (_controller == null || !_controller!.value.isInitialized) return;
  final directory = await getApplicationDocumentsDirectory();
  final imagePath = '${directory.path}/${DateTime.now()}.png';

  await _controller!.takePicture().then((XFile file) {
    file.saveTo(imagePath);
    setState(() {
      _lastPhotoPath = imagePath;
    });

    // Guardamos la imagen en la lista
    ImageStorage.savePhoto(imagePath);
  });
}


  Future<void> saveLastPhoto(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_photo', path);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Càmera"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(_isFlashOn ? Icons.flash_on : Icons.flash_off),
            onPressed: () {
              setState(() {
                _isFlashOn = !_isFlashOn;
                _controller?.setFlashMode(
                    _isFlashOn ? FlashMode.torch : FlashMode.off);
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.switch_camera),
            onPressed: () {
              setState(() {
                _isRearCamera = !_isRearCamera;
                initializeCamera();
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _controller == null || !_controller!.value.isInitialized
                ? Center(child: CircularProgressIndicator())
                : CameraPreview(_controller!),
          ),
          IconButton(
            icon: Icon(Icons.camera_alt, size: 50, color: Colors.blue),
            onPressed: capturePhoto,
          ),
          if (_lastPhotoPath != null)
            Image.file(File(_lastPhotoPath!), height: 100),
          BottomNavigation(currentIndex: 0),
        ],
      ),
    );
  }
}
