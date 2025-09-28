import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/theme_app.dart';

class AzkarContainer extends StatelessWidget {
  final String azkarImage;
  final String azkarName;
  const AzkarContainer({
    super.key,
    required this.azkarImage,
    required this.azkarName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: MediaQuery.sizeOf(context).height * 0.24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ThemeApp.primary),
      ),
      child: Column(
        children: [
          Image.asset("assets/images/$azkarImage.png", height: 185, width: 175),
          AutoSizeText(
            azkarName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
