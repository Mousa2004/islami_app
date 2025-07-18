import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/tabs/quran/mostRecently_screan.dart';
import 'package:islami_app/tabs/quran/quran_detailes.dart';
import 'package:islami_app/tabs/quran/sura.dart';
import 'package:islami_app/tabs/quran/sura_iem.dart';
import 'package:islami_app/tabs/quran/quran_services.dart';
import 'package:islami_app/theme_app.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 10,
          ),
          child: TextField(
            style: Theme.of(context).textTheme.bodyLarge,
            cursorColor: ThemeApp.white,
            onChanged: (query) {
              QuranServices.suraSearchName(query);
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: "Sura Name",
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(color: Colors.grey),
              prefixIcon: SvgPicture.asset(
                "assets/icons/quran.svg",
                colorFilter: ColorFilter.mode(
                  ThemeApp.primary,
                  BlendMode.srcIn,
                ),
                height: 28,
                width: 28,
                fit: BoxFit.scaleDown,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ThemeApp.primary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ThemeApp.primary),
              ),
            ),
          ),
        ),
        MostrecentlyScrean(),
        Container(
          margin: EdgeInsets.only(left: 21),
          width: double.infinity,
          child: Text(
            "Suras List",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),

        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              Sura sura = QuranServices.getSuraFromIndex(index);
              return InkWell(
                onTap: () async {
                  QuranServices.addMostRecentlySura(sura);
                  await Navigator.of(context).pushNamed(
                    QuranDetailes.routName,
                    arguments: QuranServices.suras[index],
                  );
                  setState(() {});
                },
                child: SuraIem(sura: QuranServices.suras[index]),
              );
            },
            separatorBuilder: (context, index) =>
                Divider(indent: 55, endIndent: 55),
            itemCount: QuranServices.suras.length,
          ),
        ),
      ],
    );
  }
}
