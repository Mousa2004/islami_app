import 'package:flutter/material.dart';
import 'package:islami_app/home_screan.dart';
import 'package:islami_app/tabs/hadeth/hadeth_details.dart';
import 'package:islami_app/tabs/quran/quran_detailes.dart';
import 'package:islami_app/tabs/quran/quran_services.dart';
import 'package:islami_app/theme_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await QuranServices.getMostRecentSure();
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
      routes: {
        HomeScrean.routName: (_) => HomeScrean(),
        QuranDetailes.routName: (_) => QuranDetailes(),
        HadethDetails.routName: (_) => HadethDetails(),
      },
      darkTheme: ThemeApp.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
