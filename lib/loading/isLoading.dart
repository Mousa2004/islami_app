import 'package:flutter/material.dart';
import 'package:islami_app/theme_app.dart';

class Isloading extends StatelessWidget {
  final Color color;
  const Isloading({super.key, this.color = ThemeApp.primary});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: color));
  }
}
