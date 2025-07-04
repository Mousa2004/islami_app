import 'package:flutter/material.dart';
import 'package:islami_app/theme_app.dart';

class RadioItem extends StatelessWidget {
  final String backgroundImage;
  final String text;
  final String imageName;

  const RadioItem({
    super.key,
    required this.backgroundImage,
    required this.text,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 133,
      margin: EdgeInsets.only(right: 20, left: 20, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ThemeApp.primary,
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          alignment: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 40),
            child: Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: ThemeApp.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Image.asset(imageName),
          ),
        ],
      ),
    );
  }
}
