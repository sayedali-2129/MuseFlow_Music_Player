import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayNowController with ChangeNotifier {
  AudioPlayer audioPlayer = AudioPlayer();

  final audioQuery = OnAudioQuery();

  bool isPlaying = false;

  Duration duration = Duration();
  Duration position = Duration();

  checkPermission() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
    } else {
      checkPermission();
    }
  }

  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playSong(String? uri) async {
    try {
      await audioPlayer.setAudioSource(AudioSource.uri(
        Uri.parse(uri!),
      ));
      notifyListeners();
      await audioPlayer.play();
      durationControl();

      notifyListeners();
    } catch (e) {
      print("Error Parsing Song:$e");
    }
  }

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

  durationControl() {
    audioPlayer.durationStream.listen((d) {
      notifyListeners();
      duration = d!;
    });

    audioPlayer.positionStream.listen((p) {
      notifyListeners();
      position = p;
    });
  }

  void changeToSeconds(int seconds) {
    Duration durationSeek = Duration(seconds: seconds);
    audioPlayer.seek(durationSeek);
  }
}
