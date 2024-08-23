import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AlphabetProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int _currentlyPlayingIndex = -1;

  int get currentlyPlayingIndex => _currentlyPlayingIndex;

  void playAudio(String url, int index) async {
    _currentlyPlayingIndex = index;
    notifyListeners();

    try {
      await _audioPlayer.setSourceAsset(url);
      await _audioPlayer.resume();

      _audioPlayer.onPlayerComplete.listen((_) {
        _currentlyPlayingIndex = -1;
        notifyListeners();
      });
    } catch (e) {
      print('Error playing audio: $e');
      _currentlyPlayingIndex = -1;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}