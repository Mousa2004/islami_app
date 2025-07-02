import 'package:flutter/material.dart';
import 'package:islami_app/bottom_navigation_select.dart';
import 'package:islami_app/bottom_navigation_unselect.dart';
import 'package:islami_app/tabs/hadeth_tab.dart';
import 'package:islami_app/tabs/quran/quran_tab.dart';
import 'package:islami_app/tabs/radio_tab.dart';
import 'package:islami_app/tabs/sebha_tab.dart';
import 'package:islami_app/tabs/time_tab.dart';
import 'package:islami_app/theme_app.dart';

class HomeScrean extends StatefulWidget {
  static const String routName = "/home";
  const HomeScrean({super.key});

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  List backgroundImageName = [
    "quran_background",
    "hadeth_background",
    "sebha_background",
    "radio_background",
    "time_background",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/${backgroundImageName[currentIndex]}.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Image.asset("assets/images/header_logo.png"),
              Expanded(child: tabs[currentIndex]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            if (currentIndex == value) return;
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: ThemeApp.primary,
        selectedItemColor: ThemeApp.white,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: BottomNavigationUnselect(imageName: "quran"),
            label: "Quran",
            activeIcon: BottomNavigationSelect(imageName: "quran"),
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationUnselect(imageName: "hadeth"),
            label: "Hadeth",
            activeIcon: BottomNavigationSelect(imageName: "hadeth"),
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationUnselect(imageName: "sebha"),
            label: "Sebha",
            activeIcon: BottomNavigationSelect(imageName: "sebha"),
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationUnselect(imageName: "radio"),
            label: "Radio",
            activeIcon: BottomNavigationSelect(imageName: "radio"),
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationUnselect(imageName: "time"),
            label: "Time",
            activeIcon: BottomNavigationSelect(imageName: "time"),
          ),
        ],
      ),
    );
  }
}
