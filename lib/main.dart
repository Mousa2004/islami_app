import 'package:flutter/material.dart';
import 'package:islami_app/home_screan.dart';
import 'package:islami_app/theme_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScrean.routName,
      routes: {HomeScrean.routName: (_) => HomeScrean()},
      darkTheme: ThemeApp.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
