import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/api/azkar_api.dart';
import 'package:islami_app/loading/isLoading.dart';
import 'package:islami_app/models/azkar_response/morning_prayer.dart';
import 'package:islami_app/provider/timer_provider.dart';
import 'package:islami_app/theme_app.dart';
import 'package:provider/provider.dart';

class AzkarDetails extends StatelessWidget {
  final String azkarName;
  const AzkarDetails({super.key, required this.azkarName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeApp.black,
      appBar: AppBar(title: Text(azkarName)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            FutureBuilder(
              future: AzkarApi.getAzkar(
                azkarName,
                (json) => MorningPrayer.fromJson(json),
              ),

              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Isloading();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Faild to load list of azkar",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  );
                } else {
                  List<MorningPrayer> prayers = snapshot.data ?? [];

                  return Expanded(
                    child: ListView.separated(
                      itemCount: prayers.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider(
                          create: (context) {
                            final provider = TimerProvider();
                            provider.setCount(
                              int.tryParse("${prayers[index].count}") ?? 0,
                            );
                            return provider;
                          },
                          child: Card(
                            color: ThemeApp.primary,
                            child: Column(
                              children: [
                                ListTile(
                                  title: AutoSizeText(
                                    textAlign: TextAlign.center,
                                    "${prayers[index].content}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(color: ThemeApp.black),
                                  ),
                                  subtitle: AutoSizeText(
                                    prayers[index].description ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(color: ThemeApp.brown),
                                  ),
                                ),
                                Consumer<TimerProvider>(
                                  builder: (context, provider, child) {
                                    return MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      color: ThemeApp.black,
                                      textColor: ThemeApp.white,
                                      onPressed: () {
                                        provider.decrement();
                                      },
                                      child: Text(
                                        "${provider.count}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(color: ThemeApp.white),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
