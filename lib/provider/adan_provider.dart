import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/api/pray_time_api.dart';
import 'package:islami_app/models/pray_time_response/pray_time_response.dart';
import 'package:islami_app/tabs/time/prayer_timer_service.dart';

class AdanProvider extends ChangeNotifier {
  PrayerTimerService? timerService;
  PrayTimeResponse? prayTimeData;
  bool isLoading = true;
  bool isPlaying = false;

  AudioPlayer audioPlayer = AudioPlayer();

  void playAdhan() async {
    try {
      await audioPlayer.setSource(AssetSource("adan/161.mp3"));
      await audioPlayer.resume();
      isPlaying = true;

      notifyListeners();
      audioPlayer.onPlayerComplete.listen((event) {
        isPlaying = false;
        notifyListeners();
      });
    } catch (e) {
      debugPrint("Audio error: $e");
    }
  }

  void stopAdhan() async {
    await audioPlayer.stop();
    isPlaying = false;
    notifyListeners();
  }

  Future<void> loadPrayTimes() async {
    try {
      final data = await PrayTimeApi.getPrayTime();
      prayTimeData = data;
      isLoading = false;
      timerService = PrayerTimerService(data.data!.timings!);
      notifyListeners();
    } catch (e) {
      isLoading = false;

      notifyListeners();
    }
  }

  @override
  void dispose() {
    timerService?.dispose();
    audioPlayer.dispose();
    super.dispose();
  }
}
