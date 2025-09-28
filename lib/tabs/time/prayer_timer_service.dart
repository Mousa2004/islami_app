import 'dart:async';
import 'package:islami_app/models/pray_time_response/timings.dart';

class PrayerTimerService {
  final Timings timings;
  Timer? _timer;

  Duration? remainingTime;
  String? nextPrayerName;

  final _controller = StreamController<PrayerTimerState>.broadcast();
  Stream<PrayerTimerState> get stream => _controller.stream;

  PrayerTimerService(this.timings) {
    _calculateNextPrayer();
    _start();
  }

  void _calculateNextPrayer() {
    final now = DateTime.now();
    final prayers = {
      "Fajr": timings.fajr,
      "Dhuhr": timings.dhuhr,
      "Asr": timings.asr,
      "Maghrib": timings.maghrib,
      "Isha": timings.isha,
    };

    for (var entry in prayers.entries) {
      final timeParts = entry.value!.split(":");
      final prayerDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(timeParts[0]),
        int.parse(timeParts[1]),
      );

      if (prayerDateTime.isAfter(now)) {
        nextPrayerName = entry.key;
        remainingTime = prayerDateTime.difference(now);
        break;
      }
    }

    _emit();
  }

  void _start() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (remainingTime != null) {
        remainingTime = remainingTime! - const Duration(seconds: 1);

        if (remainingTime!.inSeconds <= 0) {
          _calculateNextPrayer();
        }
        _emit();
      }
    });
  }

  void _emit() {
    _controller.add(
      PrayerTimerState(
        nextPrayerName: nextPrayerName,
        remainingTime: remainingTime,
      ),
    );
  }

  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
}

class PrayerTimerState {
  final String? nextPrayerName;
  final Duration? remainingTime;

  PrayerTimerState({this.nextPrayerName, this.remainingTime});
}
