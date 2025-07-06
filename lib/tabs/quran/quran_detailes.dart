import 'package:flutter/material.dart';
import 'package:islami_app/loading/isLoading.dart';
import 'package:islami_app/tabs/quran/quran_services.dart';
import 'package:islami_app/tabs/quran/sura.dart';
import 'package:islami_app/theme_app.dart';

class QuranDetailes extends StatefulWidget {
  static const String routName = "/quranDetails";
  const QuranDetailes({super.key});

  @override
  State<QuranDetailes> createState() => _QuranDetailesState();
}

class _QuranDetailesState extends State<QuranDetailes> {
  late Sura sura;
  List ayat = [];
  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as Sura;
    if (ayat.isEmpty) {
      getSuraDetailes();
    }
    return Scaffold(
      backgroundColor: ThemeApp.black,
      appBar: AppBar(title: Text(sura.engSuraName)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/header_left.png",
                  height: 92,
                  width: 92,
                  fit: BoxFit.fill,
                ),
                Text(
                  sura.arabicSuraName,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Image.asset(
                  "assets/images/header_right.png",
                  height: 92,
                  width: 92,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),

          Expanded(
            child: ayat.isEmpty
                ? Isloading()
                : SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        ayat
                            .asMap()
                            .entries
                            .map((e) => "${e.value}﴿${e.key + 1}﴾ ")
                            .join(""),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ThemeApp.primary,
                          height: 2,
                        ),
                      ),
                    ),
                  ),
          ),

          Image.asset("assets/images/footer.png", fit: BoxFit.fill),
        ],
      ),
    );
  }

  Future<void> getSuraDetailes() async {
    String suraName = await QuranServices.loadSuraFile(sura.num);
    ayat = suraName
        .split("\n")
        .where((line) => line.trim().isNotEmpty)
        .toList();

    setState(() {});
  }
}
