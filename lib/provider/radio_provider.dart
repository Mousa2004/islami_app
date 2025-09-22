import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RadioProvider extends ChangeNotifier {
  String? currentPlayinUrl;
  bool isPlaying = false;
  double currentVolume = 1.0;

  //Play

  final player = AudioPlayer();
  Future<void> play(String url) async {
    if (currentPlayinUrl == url) {
      isPlaying ? await player.pause() : player.resume();
      isPlaying = !isPlaying;
    } else {
      await player.stop();
      currentPlayinUrl = url;
      await player.play(UrlSource(url), volume: currentVolume);
      isPlaying = true;
    }
    notifyListeners();
  }

  //stop

  Future<void> stop() async {
    await player.stop();
    currentPlayinUrl = null;
    isPlaying = false;
    notifyListeners();
  }

  //volume

  Future<void> setVolume(double volume) async {
    currentVolume = volume;
    await player.setVolume(volume);
    notifyListeners();
  }
}
