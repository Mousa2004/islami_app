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

    final prayers = [
      _Prayer("Fajr", timings.fajr),
      _Prayer("Dhuhr", timings.dhuhr),
      _Prayer("Asr", timings.asr),
      _Prayer("Maghrib", timings.maghrib),
      _Prayer("Isha", timings.isha),
    ];

    for (final prayer in prayers) {
      final parts = prayer.time!.split(":");
      final prayerTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );

      if (prayerTime.isAfter(now)) {
        nextPrayerName = prayer.name;
        remainingTime = prayerTime.difference(now);
        _emit();
        return;
      }
    }

    final fajrParts = timings.fajr!.split(":");
    final tomorrowFajr = DateTime(
      now.year,
      now.month,
      now.day + 1,
      int.parse(fajrParts[0]),
      int.parse(fajrParts[1]),
    );

    nextPrayerName = "Fajr";
    remainingTime = tomorrowFajr.difference(now);
    _emit();
  }

  void _start() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (remainingTime == null) return;

      remainingTime = remainingTime! - const Duration(seconds: 1);

      if (remainingTime!.inSeconds <= 0) {
        _calculateNextPrayer();
      } else {
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

class _Prayer {
  final String name;
  final String? time;
  _Prayer(this.name, this.time);
}
