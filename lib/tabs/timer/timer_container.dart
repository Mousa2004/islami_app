import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/tabs/timer/timer_slider.dart';
import 'package:islami_app/theme_app.dart';

class TimerContainer extends StatelessWidget {
  const TimerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.32,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ThemeApp.brown,
        image: DecorationImage(
          image: AssetImage("assets/images/timer_container.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "16 Jul,\n2024",
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
                  SizedBox(height: 8),
                  Text(
                    "Tuesday",
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(color: ThemeApp.black),
                  ),
                ],
              ),
              AutoSizeText(
                "09 Muh,\n1446",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),

          Positioned(
            top: MediaQuery.sizeOf(context).height * 0.1,
            right: 0,
            left: 0,
            child: TimerSlider(),
          ),

          Positioned(
            top: MediaQuery.sizeOf(context).height * 0.25,
            left: MediaQuery.sizeOf(context).width * 0.29,
            child: Row(
              children: [
                Text(
                  "Next Pray -",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: Colors.grey[800]),
                ),
                Text(
                  "02:32",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: ThemeApp.black),
                ),
                SizedBox(width: 50),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.volume_up, size: 30, color: ThemeApp.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
