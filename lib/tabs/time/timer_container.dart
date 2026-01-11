import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/provider/adan_provider.dart';
import 'package:islami_app/tabs/time/pray_timer_formate.dart';
import 'package:islami_app/tabs/time/prayer_timer_service.dart';
import 'package:islami_app/tabs/time/timer_slider.dart';
import 'package:islami_app/theme_app.dart';
import 'package:provider/provider.dart';

class TimerContainer extends StatefulWidget {
  const TimerContainer({super.key});

  @override
  State<TimerContainer> createState() => _TimerContainerState();
}

class _TimerContainerState extends State<TimerContainer> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AdanProvider>().loadPrayTimes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final adan = Provider.of<AdanProvider>(context);

    return Container(
      height: height * 0.32.h,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: ThemeApp.brown,
        image: const DecorationImage(
          image: AssetImage("assets/images/timer_container.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          if (adan.isLoading) ...[
            const Center(child: CircularProgressIndicator(color: Colors.white)),
          ] else if (adan.prayTimeData == null) ...[
            const Center(child: Text("Failed to load timer")),
          ] else ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  PrayTimerFormate.prayTimeFormate(
                    "${adan.prayTimeData!.data!.date!.gregorian!.date}",
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
                    SizedBox(height: 8.h),
                    Text(
                      "${adan.prayTimeData!.data!.date!.gregorian!.weekday!.en}",
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge!.copyWith(color: ThemeApp.black),
                    ),
                  ],
                ),
                AutoSizeText(
                  PrayTimerFormate.prayTimeFormate(
                    "${adan.prayTimeData!.data!.date!.hijri!.date}",
                    isHijri: true,
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),

            Positioned(
              top: height * 0.09.h,
              right: 0,
              left: 0,
              child: const TimerSlider(),
            ),

            Positioned(
              top: height * 0.26.h,
              left: width * 0.10.w,
              right: width * 0.w,
              child: StreamBuilder<PrayerTimerState>(
                stream: adan.timerService?.stream,
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

                    if (remaining.inSeconds <= 0 && !adan.isPlaying) {
                      adan.playAdhan();
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
                      SizedBox(width: 8.w),
                      Text(
                        formatted,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(color: ThemeApp.black),
                      ),
                      SizedBox(width: 30.w),
                      IconButton(
                        onPressed: () {
                          adan.isPlaying ? adan.stopAdhan() : adan.playAdhan();
                        },
                        icon: Icon(
                          adan.isPlaying ? Icons.volume_up : Icons.volume_off,
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
