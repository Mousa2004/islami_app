import 'package:flutter/material.dart';
import 'package:islami_app/tabs/radio/radio_item.dart';
import 'package:islami_app/theme_app.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  List radioList = [
    {
      "backgroundImage": "assets/images/mask_radio.png",
      "text": "Radio Ibrahim Al-Akdar",
      "imageName": "assets/images/voice_radio.png",
    },
    {
      "backgroundImage": "assets/images/audio_radio.png",
      "text": "Radio Al-Qaria Yassen",
      "imageName": "assets/images/play_audio.png",
    },
    {
      "backgroundImage": "assets/images/mask_radio.png",
      "text": "Radio Ahmed Al-trabulsi",
      "imageName": "assets/images/voice_radio.png",
    },
    {
      "backgroundImage": "assets/images/mask_radio.png",
      "text": "Radio Addokali Mohammad Alalim",
      "imageName": "assets/images/voice_radio.png",
    },
  ];
  List recitersList = [
    {
      "backgroundImage": "assets/images/mask_radio.png",
      "text": "Ibrahim Al-Akdar",
      "imageName": "assets/images/voice_radio.png",
    },
    {
      "backgroundImage": "assets/images/audio_radio.png",
      "text": "Akram Alalaqmi",
      "imageName": "assets/images/play_audio.png",
    },
    {
      "backgroundImage": "assets/images/mask_radio.png",
      "text": "Majed Al-Enezi",
      "imageName": "assets/images/voice_radio.png",
    },
    {
      "backgroundImage": "assets/images/mask_radio.png",
      "text": "Malik shaibat Alhamed",
      "imageName": "assets/images/voice_radio.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 18),
            decoration: BoxDecoration(
              color: const Color(0xff202020).withAlpha(120),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              indicator: BoxDecoration(
                color: ThemeApp.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              dividerColor: ThemeApp.black.withAlpha(7),
              labelColor: ThemeApp.black,
              unselectedLabelColor: ThemeApp.white,
              tabs: [
                Tab(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 60),
                    child: Text(
                      'Radio',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 55),
                    child: Text(
                      'Reciters',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: radioList.length,
                        itemBuilder: (context, index) => RadioItem(
                          backgroundImage: radioList[index]['backgroundImage'],
                          text: radioList[index]['text'],
                          imageName: radioList[index]['imageName'],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: recitersList.length,
                        itemBuilder: (context, index) => RadioItem(
                          backgroundImage:
                              recitersList[index]['backgroundImage'],
                          text: recitersList[index]['text'],
                          imageName: recitersList[index]['imageName'],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
