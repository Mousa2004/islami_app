import 'package:flutter/material.dart';

class ThemeApp {
  static const Color primary = Color(0xffE2BE7F);
  static const Color black = Color(0xff202020);
  static const Color white = Color(0xffFFFFFF);
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: black,
      titleTextStyle: TextStyle(
        color: primary,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(color: primary),
      centerTitle: true,
    ),
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
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: primary,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: white,
      ),
    ),
  );
}
