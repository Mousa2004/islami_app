import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/home_screan.dart';
import 'package:islami_app/theme_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScrean extends StatelessWidget {
  static const String routName = "/onboarding";
  const OnboardingScrean({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> onboardingList = [
      {
        "image": "assets/images/onboarding1.png",
        "title": "Welcome To Islmi App",
        "body": "",
      },
      {
        "image": "assets/images/onboarding2.png",
        "title": "Welcome To Islmi App",
        "body": "We Are Very Excited To Have You In Our Community",
      },
      {
        "image": "assets/images/onboarding3.png",
        "title": "Reading the Quran",
        "body": "Read, and your Lord is the Most Generous",
      },
      {
        "image": "assets/images/onboarding4.png",
        "title": "Bearish",
        "body": "Praise the name of your Lord, the Most High",
      },
      {
        "image": "assets/images/onboarding5.png",
        "title": "Holy Quran Radio",
        "body":
            "You can listen to the Holy Quran Radio through the application for free and easily",
      },
    ];

    return Scaffold(
      backgroundColor: ThemeApp.black,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/header_logo.png"),
            Expanded(
              child: IntroductionScreen(
                pages: onboardingList.map((item) {
                  return PageViewModel(
                    decoration: PageDecoration(
                      pageColor: ThemeApp.black,
                      imageFlex: 2,
                      bodyFlex: 1,
                      titlePadding: const EdgeInsets.symmetric(vertical: 45),
                      imagePadding: const EdgeInsets.only(top: 25),
                    ),
                    image: Center(
                      child: Image.asset(item["image"]!, fit: BoxFit.contain),
                    ),
                    titleWidget: Text(
                      item["title"] ?? "",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    bodyWidget: Text(
                      textAlign: TextAlign.center,
                      item["body"] ?? "",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(color: ThemeApp.primary),
                    ),
                  );
                }).toList(),
                showBackButton: true,
                back: Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.sizeOf(context).width * 0.1,
                  ),
                  child: Text(
                    "Back",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: ThemeApp.primary),
                  ),
                ),
                next: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width * 0.1,
                  ),
                  child: Text(
                    "Next",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: ThemeApp.primary),
                  ),
                ),
                nextFlex: 0,
                done: Text(
                  "Finish",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(color: ThemeApp.primary),
                ),
                dotsContainerDecorator: const BoxDecoration(
                  color: ThemeApp.black,
                ),
                dotsDecorator: DotsDecorator(
                  color: Color(0xff707070),
                  activeColor: ThemeApp.primary,

                  activeSize: Size(20, 10),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                onDone: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('onboarding_done', true);
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(HomeScrean.routName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
