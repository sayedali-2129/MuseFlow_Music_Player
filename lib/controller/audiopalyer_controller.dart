import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/controller/api_controller.dart';

class PlayNowController with ChangeNotifier {
  late AudioPlayer audioPlayer;
  PlayNowController() {
    audioPlayer = AudioPlayer();
  }
  bool isPlaying = true;
  ApiController apiController = ApiController();

  int currentSongIndex = 0;

  Duration duration = Duration();
  Duration position = Duration();

  Future<void> playSong(String songUrl) async {
    try {
      await audioPlayer.setUrl(songUrl);
      await audioPlayer.play();

      notifyListeners();
    } catch (e) {
      print('error loading audio: $e');
    }
  }

  // Future<void> playAndPauseButton() async {
  //   if (isPlaying == true) {
  //     await audioPlayer.pause();
  //     isPlaying = false;
  //     notifyListeners();
  //   } else {
  //     await audioPlayer.play();
  //     isPlaying = true;
  //     notifyListeners();
  //   }
  // }

  Future<void> pauseSong() async {
    await audioPlayer.pause();
    isPlaying = false;
    notifyListeners();
  }

  Future<void> resumeSong() async {
    await audioPlayer.play();
    isPlaying = true;
    notifyListeners();
  }

  // Future<void> nextSong() async {
  //   currentSongIndex =
  //       (currentSongIndex + 1) % apiController.musicApiResponce.music!.length;
  //   await playSong();
  // }
  void disposePlayer() {
    audioPlayer.dispose();
  }
}
