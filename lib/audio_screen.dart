import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:multimedia/bottom_navigation.dart';
import 'dart:math';
import 'package:file_picker/file_picker.dart';

class AudioScreen extends StatefulWidget {
  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer(); // Reproductor de audio
  bool _isPlaying = false; // Estado de reproducción
  Duration _duration = Duration.zero; // Duración total de la canción
  Duration _position = Duration.zero; // Posición actual del audio
  double _playbackSpeed = 1.0; // Velocidad de reproducción
  bool _isShuffle = false; // Modo aleatorio activado/desactivado
  bool _isLoop = false; // Modo bucle activado/desactivado
  bool _isInfinite = false; // Reproducción infinita activada/desactivada
  List<double> playbackSpeeds = [0.5, 1.0, 1.5, 2.0]; // Opciones de velocidad de reproducción

  // Lista de canciones disponibles
  List<Map<String, String>> songs = [
    {"title": "Rosas - La Oreja de Van Gogh", "file": "rosas.mp3"},
    {"title": "Playa - La Oreja de Van Gogh", "file": "playa.mp3"},
    {"title": "Amour - Zaz", "file": "amour.mp3"},
    {"title": "Rosas - Nwalla3 Jaw", "file": "Nancy.mp3"},
    {"title": "Playa - Kalam 3eneh", "file": "Sherine.mp3"},
    {"title": "Amour - Ya Na7la", "file": "Heifa.mp3"},
    {"title": "Playa - Ya Lella winek", "file": "Bouchnak.mp3"},
    {"title": "Amour - Ta7t Jasmina", "file": "Jouini.mp3"},
  ];

  String currentSongTitle = "Rosas - La Oreja de Van Gogh"; // Canción en reproducción
  String currentSongFile = "rosas.mp3"; // Archivo de la canción en reproducción

  @override
  void initState() {
    super.initState();
    _setupAudioListeners(); // Configurar oyentes de audio
    _playAudio(currentSongFile); // Iniciar reproducción automática
  }

  // Configurar los oyentes para actualizar duración y posición del audio
  void _setupAudioListeners() {
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
  }

  // Reproducir un archivo de audio
  void _playAudio(String file) async {
    await _audioPlayer.stop();
    await _audioPlayer.setPlaybackRate(_playbackSpeed);
    await _audioPlayer.play(AssetSource(file));
    setState(() {
      _isPlaying = true;
    });
  }

  // Alternar entre reproducir y pausar el audio
  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.resume();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  // Buscar una posición específica en el audio
  void _seekAudio(double value) {
    final position = Duration(seconds: value.toInt());
    _audioPlayer.seek(position);
  }

  // Cambiar la velocidad de reproducción
  void _changePlaybackSpeed(double speed) async {
    await _audioPlayer.setPlaybackRate(speed);
    setState(() {
      _playbackSpeed = speed;
    });
  }

  // Avanzar 10 segundos
  void _seekForward() {
    _seekAudio((_position + Duration(seconds: 10)).inSeconds.toDouble());
  }

  // Retroceder 10 segundos
  void _seekBackward() {
    _seekAudio((_position - Duration(seconds: 10)).inSeconds.toDouble());
  }

  // Agregar una canción a la lista
  void _addSong(String title, String file) {
    setState(() {
      songs.add({"title": title, "file": file});
    });
  }

  // Seleccionar un archivo de audio desde el dispositivo
  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null && result.files.single.path != null) {
      _addSong(result.files.single.name, result.files.single.path!);
    }
  }

  // Eliminar una canción de la lista
  void _removeSong(String file) {
    setState(() {
      songs.removeWhere((song) => song["file"] == file);
    });
  }

  // Reproducir la siguiente canción
  void _playNextSong() {
    int currentIndex = songs.indexWhere((song) => song["file"] == currentSongFile);
    int nextIndex;
    if (_isShuffle) {
      nextIndex = Random().nextInt(songs.length);
    } else {
      nextIndex = currentIndex + 1;
      if (nextIndex >= songs.length) {
        nextIndex = _isInfinite ? 0 : currentIndex;
      }
    }
    _selectSong(songs[nextIndex]["title"]!, songs[nextIndex]["file"]!);
  }

  // Alternar el modo aleatorio
  void _toggleShuffle() {
    setState(() {
      _isShuffle = !_isShuffle;
    });
  }

  // Alternar el modo bucle
  void _toggleLoop() {
    setState(() {
      _isLoop = !_isLoop;
    });
  }

  // Alternar la reproducción infinita
  void _toggleInfinite() {
    setState(() {
      _isInfinite = !_isInfinite;
    });
  }

  // Seleccionar una canción para reproducir
  void _selectSong(String title, String file) {
    setState(() {
      currentSongTitle = title;
      currentSongFile = file;
    });
    _playAudio(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multimedia"), centerTitle: true),
      body: Column(
        children: [
          Text(currentSongTitle, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Slider(
            min: 0,
            max: _duration.inSeconds.toDouble(),
            value: _position.inSeconds.toDouble(),
            onChanged: (value) => _seekAudio(value),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(icon: Icon(Icons.replay_10), onPressed: _seekBackward),
              IconButton(icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow), onPressed: _playPauseAudio),
              IconButton(icon: Icon(Icons.forward_10), onPressed: _seekForward),
            ],
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
