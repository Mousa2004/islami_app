import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/theme_app.dart';

class AzkarContainer extends StatelessWidget {
  const AzkarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ThemeApp.primary),
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/images/morning_azkar.png",
            height: 185,
            width: 175,
          ),
          AutoSizeText(
            "Morning Azkar",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
