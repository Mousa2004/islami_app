import 'package:flutter/material.dart';
import 'package:islami_app/home_screan.dart';
import 'package:islami_app/onboarding/onboarding_screan.dart';
import 'package:islami_app/tabs/hadeth/hadeth_details.dart';
import 'package:islami_app/tabs/quran/quran_detailes.dart';
import 'package:islami_app/tabs/quran/quran_services.dart';
import 'package:islami_app/theme_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await QuranServices.getMostRecentSure();
  final prefs = await SharedPreferences.getInstance();
  bool onboardingDone = prefs.getBool('onboarding_done') ?? false;
  runApp(MyApp(onboardingDone: onboardingDone));
}

class MyApp extends StatefulWidget {
  final bool onboardingDone;
  const MyApp({super.key, required this.onboardingDone});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: widget.onboardingDone
          ? HomeScrean.routName
          : OnboardingScrean.routName,
      routes: {
        OnboardingScrean.routName: (_) => OnboardingScrean(),
        HomeScrean.routName: (_) => HomeScrean(),
        QuranDetailes.routName: (_) => QuranDetailes(),
        HadethDetails.routName: (_) => HadethDetails(),
      },
      darkTheme: ThemeApp.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
