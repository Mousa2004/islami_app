import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/api/radio_api.dart';
import 'package:islami_app/api/reciters_api.dart';
import 'package:islami_app/models/radio_response.dart';
import 'package:islami_app/models/reciters_response.dart';
import 'package:islami_app/tabs/radio/radio_item.dart';
import 'package:islami_app/tabs/radio/reciters_item.dart';
import 'package:islami_app/theme_app.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xb3202020),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: TabBar(
                dividerHeight: 0,
                indicator: BoxDecoration(
                  color: ThemeApp.primary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelStyle: Theme.of(context).textTheme.bodyLarge,
                labelStyle: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: ThemeApp.black),
                tabs: [
                  Tab(child: Text("Radio")),
                  Tab(child: Text("Reciters")),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FutureBuilder(
                    future: RadioApi.getRadio(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: ThemeApp.primary,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Faild to load radio",
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(color: ThemeApp.white),
                          ),
                        );
                      } else {
                        RadioResponse radio = snapshot.data!;
                        return ListView.builder(
                          itemCount: radio.radios?.length,
                          itemBuilder: (context, index) => RadioItem(
                            name: radio.radios?[index].name ?? "",
                            url: radio.radios?[index].url ?? "",
                          ),
                        );
                      }
                    },
                  ),
                  FutureBuilder(
                    future: RecitersApi.getReciters(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: ThemeApp.primary,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Faild to load reciters",
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(color: ThemeApp.white),
                          ),
                        );
                      } else {
                        RecitersResponse reciter = snapshot.data!;
                        return ListView.builder(
                          itemCount: reciter.reciters?.length,
                          itemBuilder: (context, index) {
                            var moshaf = reciter.reciters?[index].moshaf?[0];

                            List<String> surahUrls = [];
                            if (moshaf?.surahList != null) {
                              surahUrls = moshaf!.surahList!
                                  .split(',')
                                  .map(
                                    (num) =>
                                        "${moshaf.server}${num.padLeft(3, '0')}.mp3",
                                  )
                                  .toList();
                            }

                            return RecitersItem(
                              name: reciter.reciters?[index].name ?? "",
                              url: surahUrls,
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
