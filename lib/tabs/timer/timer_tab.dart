import 'package:flutter/material.dart';
import 'package:islami_app/tabs/timer/azkar_container.dart';
import 'package:islami_app/tabs/timer/timer_container.dart';

class TimerTab extends StatelessWidget {
  const TimerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimerContainer(),
          SizedBox(height: 15),
          Text("Azkar", style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: 15),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => AzkarContainer(),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
