import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/theme_app.dart';

class BottomNavigationSelect extends StatelessWidget {
  final String imageName;

  const BottomNavigationSelect({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66),
        color: ThemeApp.black.withAlpha(60),
      ),
      child: SvgPicture.asset(
        "assets/icons/$imageName.svg",
        height: 22,
        width: 22,
        fit: BoxFit.fill,
        colorFilter: const ColorFilter.mode(ThemeApp.white, BlendMode.srcIn),
      ),
    );
  }
}
