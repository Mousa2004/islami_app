import 'package:flutter/material.dart';
import 'package:islami_app/tabs/quran/sura_iem.dart';
import 'package:islami_app/tabs/quran/quran_services.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
            itemBuilder: (context, index) =>
                SuraIem(sura: QuranServices.suras[index]),
            separatorBuilder: (context, index) =>
                Divider(indent: 55, endIndent: 55),
            itemCount: QuranServices.arabicQurranSuras.length,
          ),
        ),
      ],
    );
  }
}
