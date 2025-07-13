import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int currentIndex = 0;

  List<String> azkar = ["سبحان الله", "الحمد لله", "الله أكبر"];
  List<int> maxCounts = [33, 33, 34];

  void incrementCounter() {
    setState(() {
      counter++;
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
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: incrementCounter,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 26, right: 26, top: 8, bottom: 8),
              height: MediaQuery.sizeOf(context).height * 0.5,
              width: 379,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/sebha.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.09),
                  Text(
                    azkar[currentIndex],
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "$counter",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
