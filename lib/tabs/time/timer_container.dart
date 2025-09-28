import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/api/pray_time_api.dart';
import 'package:islami_app/models/pray_time_response/pray_time_response.dart';
import 'package:islami_app/tabs/time/pray_timer_formate.dart';
import 'package:islami_app/tabs/time/prayer_timer_service.dart';
import 'package:islami_app/tabs/time/timer_slider.dart';
import 'package:islami_app/theme_app.dart';

class TimerContainer extends StatefulWidget {
  const TimerContainer({super.key});

  @override
  State<TimerContainer> createState() => _TimerContainerState();
}

class _TimerContainerState extends State<TimerContainer> {
  PrayerTimerService? _timerService;
  PrayTimeResponse? _prayTimeData;
  bool _isLoading = true;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _loadPrayTimes();
  }

  AudioPlayer audioPlayer = AudioPlayer();

  void playAdhan() async {
    await audioPlayer.play(
      UrlSource("https://media.sd.ma/assabile/adhan_3435370/f5370aa1a7e2.mp3"),
    );
    setState(() => isPlaying = true);

    audioPlayer.onPlayerComplete.listen((event) {
      setState(() => isPlaying = false);
    });
  }

  void stopAdhan() async {
    await audioPlayer.stop();
    setState(() => isPlaying = false);
  }

  Future<void> _loadPrayTimes() async {
    try {
      final data = await PrayTimeApi.getPrayTime();
      setState(() {
        _prayTimeData = data;
        _isLoading = false;
        _timerService = PrayerTimerService(data.data!.timings!);
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _timerService?.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Container(
      height: height * 0.32,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ThemeApp.brown,
        image: const DecorationImage(
          image: AssetImage("assets/images/timer_container.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          if (_isLoading) ...[
            const Center(child: CircularProgressIndicator(color: Colors.white)),
          ] else if (_prayTimeData == null) ...[
            const Center(child: Text("Failed to load timer")),
          ] else ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  PrayTimerFormate.prayTimeFormate(
                    "${_prayTimeData!.data!.date!.gregorian!.date}",
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Column(
                  children: [
                    Text(
                      "Pray Time",
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge!.copyWith(color: ThemeApp.brown),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${_prayTimeData!.data!.date!.gregorian!.weekday!.en}",
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge!.copyWith(color: ThemeApp.black),
                    ),
                  ],
                ),
                AutoSizeText(
                  PrayTimerFormate.prayTimeFormate(
                    "${_prayTimeData!.data!.date!.hijri!.date}",
                    isHijri: true,
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),

            Positioned(
              top: height * 0.1,
              right: 0,
              left: 0,
              child: const TimerSlider(),
            ),

            Positioned(
              top: height * 0.26,
              left: width * 0.10,
              right: width * 0,
              child: StreamBuilder<PrayerTimerState>(
                stream: _timerService?.stream,
                builder: (context, snapshot) {
                  final state = snapshot.data;

                  String formatted = "--:--:--";
                  if (state?.remainingTime != null) {
                    final remaining = state!.remainingTime!;
                    final h = remaining.inHours.toString().padLeft(2, '0');
                    final m = (remaining.inMinutes % 60).toString().padLeft(
                      2,
                      '0',
                    );
                    final s = (remaining.inSeconds % 60).toString().padLeft(
                      2,
                      '0',
                    );
                    formatted = "$h:$m:$s";

                    if (remaining.inSeconds <= 0 && !isPlaying) {
                      playAdhan();
                    }
                  }

                  return Row(
                    children: [
                      Text(
                        "Next Pray - ${state?.nextPrayerName ?? ''}",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        formatted,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(color: ThemeApp.black),
                      ),
                      const SizedBox(width: 30),
                      IconButton(
                        onPressed: () {
                          isPlaying ? stopAdhan() : playAdhan();
                        },
                        icon: Icon(
                          isPlaying ? Icons.volume_up : Icons.volume_off,
                          size: 30,
                          color: ThemeApp.black,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
