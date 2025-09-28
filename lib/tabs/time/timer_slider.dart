import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/api/pray_time_api.dart';
import 'package:islami_app/loading/isLoading.dart';
import 'package:islami_app/tabs/time/pray_timer_formate.dart';
import 'package:islami_app/theme_app.dart';

class TimerSlider extends StatelessWidget {
  const TimerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PrayTimeApi.getPrayTime(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Isloading();
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "Failed to load timer",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        } else {
          final timer = snapshot.data!;
          final offset = timer.data!.meta!.offset!.toJson().entries.toList();
          final time = timer.data!.timings!.toJson().entries.toList();

          return CarouselSlider.builder(
            itemCount: 6,
            itemBuilder: (context, index, realIndex) => Container(
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [ThemeApp.primary, ThemeApp.black],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * .01),
                  AutoSizeText(
                    offset[index].key,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 19,
                      color: ThemeApp.primary,
                    ),
                  ),
                  SizedBox(height: 5),
                  AutoSizeText(
                    textAlign: TextAlign.center,
                    PrayTimerFormate.formatTime(time[index].value),
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            options: CarouselOptions(
              height: 140,
              enlargeCenterPage: true,
              enlargeFactor: 0.25,
              viewportFraction: 0.35,
            ),
          );
        }
      },
    );
  }
}
