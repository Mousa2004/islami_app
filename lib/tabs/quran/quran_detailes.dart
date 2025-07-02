import 'package:flutter/material.dart';
import 'package:islami_app/tabs/quran/sura.dart';
import 'package:islami_app/theme_app.dart';

class QuranDetailes extends StatelessWidget {
  static const String routName = "/quranDetails";
  const QuranDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    Sura? sura = ModalRoute.of(context)!.settings.arguments as Sura;
    return Scaffold(
      backgroundColor: ThemeApp.black,
      appBar: AppBar(title: Text(sura.engSuraName)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/header_left.png",
                  height: 92,
                  width: 92,
                  fit: BoxFit.fill,
                ),
                Text(
                  sura.arabicSuraName,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Image.asset(
                  "assets/images/header_right.png",
                  height: 92,
                  width: 92,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
