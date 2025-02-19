import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:multimedia/bottom_navigation.dart';

class AudioScreen extends StatefulWidget {
  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  String songTitle = "Rosas - La Oreja de Van Gogh"; // 🔹 Nom de la cançó

  @override
  void initState() {
    super.initState();

    _audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });

    _audioPlayer.onPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _isPlaying = false;
        _position = Duration.zero;
      });
    });
  }

  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.setVolume(1.0);
      await _audioPlayer.play(AssetSource("rosas.mp3"));
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _seekAudio(double value) {
    final position = Duration(seconds: value.toInt());
    _audioPlayer.seek(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multimedia"), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            songTitle, // 🔹 Mostrem el nom de la cançó
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          
          // 🔹 Botó de Reproduir/Pausar amb icona
          IconButton(
            iconSize: 60,
            icon: Icon(_isPlaying ? Icons.pause_circle : Icons.play_circle),
            onPressed: _playPauseAudio,
          ),

          SizedBox(height: 20),

          // 🔹 Barra de progrés de la cançó
          Slider(
            min: 0,
            max: _duration.inSeconds.toDouble(),
            value: _position.inSeconds.toDouble(),
            onChanged: (value) => _seekAudio(value),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: 2, cameras: []),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
