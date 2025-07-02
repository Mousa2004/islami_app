import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationUnselect extends StatelessWidget {
  final String imageName;

  const BottomNavigationUnselect({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(66)),
      child: SvgPicture.asset("assets/icons/$imageName.svg"),
    );
  }
}
