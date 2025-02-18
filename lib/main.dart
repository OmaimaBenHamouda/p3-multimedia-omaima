import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  MyApp({required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CameraScreen(cameras: cameras),
    );
  }
}


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
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Photo Taken"),
          content: Text("Photo saved at: $imagePath"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    });
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
            icon: Icon(Icons.camera_alt, size: 50, color: Colors.blue), // Ícono de foto
            onPressed: capturePhoto,
          ),
          if (_lastPhotoPath != null)
            Image.file(File(_lastPhotoPath!), height: 100),
          _buildBottomNavigationBar(context, 0),
        ],
      ),
    );
  }
}

class ImageScreen extends StatelessWidget {
  final String? lastPhotoPath;
  ImageScreen({this.lastPhotoPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Foto"), centerTitle: true),
      body: Center(
        child: lastPhotoPath == null
            ? Text("No hi ha cap imatge capturada")
            : Image.file(File(lastPhotoPath!)),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, 1),
    );
  }
}

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
      bottomNavigationBar: _buildBottomNavigationBar(context, 2),
    );
  }
}

Widget _buildBottomNavigationBar(BuildContext context, int currentIndex) {
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
