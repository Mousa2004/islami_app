import 'package:flutter/material.dart';
import 'package:islami_app/api/azkar_list_image.dart';
import 'package:islami_app/tabs/time/azkar_container.dart';
import 'package:islami_app/tabs/time/azkar_details.dart';
import 'package:islami_app/tabs/time/timer_container.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimerContainer(),
          SizedBox(height: 15),
          Text("Azkar", style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: 15),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AzkarDetails(
                        azkarName: AzkarListImage.azkarList[index].azkarName,
                      ),
                    ),
                  );
                },
                child: AzkarContainer(
                  azkarImage: AzkarListImage.azkarList[index].imageName,
                  azkarName: AzkarListImage.azkarList[index].azkarName,
                ),
              ),
              itemCount: AzkarListImage.azkarList.length,
            ),
          ),
        ],
      ),
    );
  }
}
