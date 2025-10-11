import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/tabs/quran/mostecently_item.dart';
import 'package:islami_app/tabs/quran/quran_services.dart';

class MostrecentlyScrean extends StatelessWidget {
  const MostrecentlyScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: QuranServices.mostRecentlysura.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Most Recently", style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: 10.h),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.14.h,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => MostecentlyItem(
                  sura: QuranServices.mostRecentlysura.reversed.toList()[index],
                ),

                separatorBuilder: (_, _) => SizedBox(width: 10.w),
                itemCount: QuranServices.mostRecentlysura.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
