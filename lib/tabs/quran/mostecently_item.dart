import 'package:flutter/material.dart';
import 'package:islami_app/tabs/quran/quran_detailes.dart';
import 'package:islami_app/tabs/quran/sura.dart';
import 'package:islami_app/theme_app.dart';

class MostecentlyItem extends StatelessWidget {
  final Sura sura;

  const MostecentlyItem({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(QuranDetailes.routName, arguments: sura);
      },
      child: Container(
        height: double.infinity,
        width: MediaQuery.sizeOf(context).width * 0.7,
        decoration: BoxDecoration(
          color: ThemeApp.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    sura.engSuraName,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall!.copyWith(color: ThemeApp.black),
                  ),
                  Text(
                    sura.arabicSuraName,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall!.copyWith(color: ThemeApp.black),
                  ),
                  Text(
                    "${sura.ayaNumber}",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: ThemeApp.black),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                "assets/images/most_recently.png",
                width: 151,
                height: 131,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
