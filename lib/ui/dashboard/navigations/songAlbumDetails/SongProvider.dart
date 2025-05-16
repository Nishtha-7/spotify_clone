
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'song.dart';

class SongProvider with ChangeNotifier {
  final AudioPlayer audioPlayer = AudioPlayer();

  Song? _currentSong;
  bool _isPlaying = false;
  double _progress = 0.0;

  Song? get currentSong => _currentSong;
  bool get isPlaying => _isPlaying;
  double get progress => _progress;

  void playSong(Song song) {
    _currentSong = song;
    _isPlaying = true;
    notifyListeners();
  }

  void pauseSong() {
    _isPlaying = false;
    notifyListeners();
  }

  void clearSong() {
    _currentSong = null;
    _isPlaying = false;
    _progress = 0.0;
    notifyListeners();
  }

  void updateProgress(double value) {
    _progress = value;
    notifyListeners();
  }
}
