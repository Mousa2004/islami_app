import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeApp {
  static const Color primary = Color(0xffE2BE7F);
  static const Color black = Color(0xff202020);
  static const Color white = Color(0xffFFFFFF);
  static const Color brown = Color(0xff856B3F);
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: black,
      titleTextStyle: TextStyle(
        color: primary,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(color: primary),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        color: white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        color: white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: primary,
      ),
      displaySmall: TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w700,
        color: white,
      ),
    ),
  );
}
