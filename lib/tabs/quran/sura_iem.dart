import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/tabs/quran/sura.dart';

class SuraIem extends StatelessWidget {
  final Sura sura;
  const SuraIem({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 52.h,
        width: 52.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/frame_num.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Text(
          "${sura.num}",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      title: Text(
        sura.engSuraName,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(
        "${sura.ayaNumber} Verses",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Text(
        sura.arabicSuraName,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
