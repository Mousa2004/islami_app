import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/theme_app.dart';

class TimerSlider extends StatelessWidget {
  const TimerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Maghrib", style: Theme.of(context).textTheme.bodyMedium),

            Text(
              "04:38",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(color: ThemeApp.white),
            ),
            Text("Pm", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
      options: CarouselOptions(
        height: 120,
        enlargeCenterPage: true,
        enlargeFactor: 0.25,
        viewportFraction: 0.35,
      ),
    );
  }
}
