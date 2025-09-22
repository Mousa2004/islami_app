import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class RecitersProvider extends ChangeNotifier {
  String? currentPlayingUrl;
  bool isPlaying = false;
  double currentVolume = 1.0;

  int _currentIndex = 0;
  List<String> _playlist = [];
  List<String> get playlist => _playlist;
  final player = AudioPlayer();

  RecitersProvider() {
    // لما التلاوة تخلص
    player.onPlayerComplete.listen((event) {
      _playNext();
    });
  }

  /// تشغيل ليست سور كاملة من البداية أو من مكان معين
  Future<void> playList(List<String> urls, {int startIndex = 0}) async {
    if (listEquals(_playlist, urls)) {
      if (isPlaying) {
        await player.pause();
      } else {
        await player.resume();
      }
      isPlaying = !isPlaying;
    } else {
      await player.stop();
      _playlist = urls;
      _currentIndex = startIndex;
      currentPlayingUrl = _playlist[_currentIndex];
      await player.play(UrlSource(currentPlayingUrl!), volume: currentVolume);
      isPlaying = true;
    }
    notifyListeners();
  }

  /// تشغيل سورة معينة
  Future<void> play(String url) async {
    if (currentPlayingUrl == url) {
      isPlaying ? await player.pause() : await player.resume();
      isPlaying = !isPlaying;
    } else {
      await player.stop();
      currentPlayingUrl = url;
      await player.play(UrlSource(url), volume: currentVolume);
      isPlaying = true;
    }
    notifyListeners();
  }

  /// تشغيل السورة التالية
  Future<void> _playNext() async {
    if (_playlist.isNotEmpty && _currentIndex < _playlist.length - 1) {
      _currentIndex++;
      await play(_playlist[_currentIndex]);
    } else {
      // خلصت القائمة
      isPlaying = false;
      currentPlayingUrl = null;
      notifyListeners();
    }
  }

  /// التنقل للسورة التالية يدوي
  Future<void> next() async {
    await _playNext();
  }

  /// التنقل للسورة السابقة يدوي
  Future<void> previous() async {
    if (_playlist.isNotEmpty && _currentIndex > 0) {
      _currentIndex--;
      await play(_playlist[_currentIndex]);
    }
  }

  // إيقاف
  Future<void> stop() async {
    await player.stop();
    currentPlayingUrl = null;
    isPlaying = false;
    notifyListeners();
  }

  // تغيير الصوت
  Future<void> setVolume(double volume) async {
    currentVolume = volume;
    await player.setVolume(volume);
    notifyListeners();
  }
}
