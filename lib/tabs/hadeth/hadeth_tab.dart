import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:islami_app/tabs/hadeth/hadeth_item.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: double.infinity,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
      ),
      itemCount: 50,
      itemBuilder: (BuildContext context, int index, _) =>
          HadethItem(index: index),
    );
  }
}
