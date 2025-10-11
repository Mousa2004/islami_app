import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/provider/radio_provider.dart';
import 'package:islami_app/theme_app.dart';
import 'package:provider/provider.dart';

class RadioItem extends StatefulWidget {
  final String name;
  final String url;

  const RadioItem({super.key, required this.name, required this.url});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  double volume = 1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.15.h,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ThemeApp.primary,
        image: const DecorationImage(
          image: AssetImage("assets/images/mask_radio.png"),
          alignment: Alignment.bottomLeft,
        ),
      ),
      child: Consumer<RadioProvider>(
        builder: (BuildContext context, state, Widget? child) {
          return Column(
            children: [
              SizedBox(height: 8.h),
              Text(
                widget.name,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: ThemeApp.black),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      await state.stop();
                    },
                    icon: const Icon(Icons.stop_circle, size: 35),
                  ),
                  SizedBox(width: 8.w),

                  IconButton(
                    onPressed: () async {
                      await state.play(widget.url);
                    },
                    icon: Icon(
                      (state.isPlaying && state.currentPlayinUrl == widget.url)
                          ? Icons.pause
                          : Icons.play_circle_filled_sharp,
                      size: 35,
                    ),
                  ),
                  SizedBox(width: 8.w),

                  IconButton(
                    onPressed: () async {
                      double newVolume = (volume == 0.0) ? 1.0 : 0.0;
                      await state.setVolume(newVolume);
                      setState(() {
                        volume = newVolume;
                      });
                    },
                    icon: Icon(
                      volume > 0 ? Icons.volume_up : Icons.volume_off,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
