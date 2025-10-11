import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/home_screan.dart';
import 'package:islami_app/onboarding/onboarding_screan.dart';
import 'package:islami_app/provider/radio_provider.dart';
import 'package:islami_app/provider/reciters_provider.dart';
import 'package:islami_app/tabs/hadeth/hadeth_details.dart';
import 'package:islami_app/tabs/quran/quran_detailes.dart';
import 'package:islami_app/tabs/quran/quran_services.dart';
import 'package:islami_app/theme_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await QuranServices.getMostRecentSure();
  final prefs = await SharedPreferences.getInstance();
  bool onboardingDone = prefs.getBool('onboarding_done') ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RadioProvider()),
        ChangeNotifierProvider(create: (context) => RecitersProvider()),
      ],

      child: MyApp(onboardingDone: onboardingDone),
    ),
  );
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
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,

      child: Builder(
        builder: (context) {
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
        },
      ),
    );
  }
}
