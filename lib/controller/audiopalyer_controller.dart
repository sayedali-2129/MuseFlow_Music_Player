import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayNowController with ChangeNotifier {
  late AudioPlayer audioPlayer;

  PlayNowController() {
    audioPlayer = AudioPlayer();
  }

  Future<void> playSong(String songPath) async {
    try {
      await audioPlayer.setUrl(songPath);
      await audioPlayer.play();

      notifyListeners();
    } catch (e) {
      print('error loading audio: $e');
    }
  }

  Future<void> pauseSong() async {
    await audioPlayer.pause();
    notifyListeners();
  }
}
