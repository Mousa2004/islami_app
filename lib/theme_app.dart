import 'package:flutter/material.dart';

class ThemeApp {
  static const Color primary = Color(0xffE2BE7F);
  static const Color black = Color(0xff202020);
  static const Color white = Color(0xffFFFFFF);
  static ThemeData darkTheme = ThemeData(
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        color: white,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        color: white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
