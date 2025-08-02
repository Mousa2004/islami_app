import 'package:flutter/material.dart';
import 'dart:math';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int currentIndex = 0;
  double angle = 0;

  List<String> azkar = ["سبحان الله", "الحمد لله", "الله أكبر"];
  List<int> maxCounts = [33, 33, 34];

  void incrementCounter() {
    setState(() {
      counter++;
      angle += (15 * pi / 100);
      if (counter > maxCounts[currentIndex]) {
        counter = 0;
        currentIndex++;
        if (currentIndex >= azkar.length) {
          currentIndex = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset("assets/images/sebha_part1.png"),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.sizeOf(context).height * 0.025,
                ),
                child: InkWell(
                  onTap: incrementCounter,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.rotate(
                        angle: angle,
                        child: Image.asset("assets/images/sebha_part2.png"),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            azkar[currentIndex],
                            style: Theme.of(context).textTheme.displaySmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10),
                          Text(
                            textAlign: TextAlign.center,
                            "$counter",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 16),
      ],
    );
  }
}
