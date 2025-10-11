import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/provider/reciters_provider.dart';
import 'package:islami_app/theme_app.dart';
import 'package:provider/provider.dart';

class RecitersItem extends StatefulWidget {
  final String name;
  final List<String> url;

  const RecitersItem({super.key, required this.name, required this.url});

  @override
  State<RecitersItem> createState() => _RecitersItemState();
}

class _RecitersItemState extends State<RecitersItem> {
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
      child: Consumer<RecitersProvider>(
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
                  //next
                  IconButton(
                    onPressed: () async {
                      await state.next();
                    },
                    icon: Icon(Icons.skip_next_sharp, size: 35),
                  ),
                  //stop
                  IconButton(
                    onPressed: () async {
                      await state.stop();
                    },
                    icon: const Icon(Icons.stop_circle, size: 35),
                  ),
                  const SizedBox(width: 8),

                  //play
                  IconButton(
                    onPressed: () async {
                      await state.playList(widget.url);
                    },
                    icon: Icon(
                      (state.isPlaying &&
                              listEquals(state.playlist, widget.url))
                          ? Icons.pause
                          : Icons.play_circle_filled_sharp,
                      size: 35,
                    ),
                  ),

                  SizedBox(width: 8.w),
                  IconButton(
                    onPressed: () async {
                      await state.previous();
                    },
                    icon: Icon(Icons.skip_previous, size: 35),
                  ),
                  SizedBox(width: 8.w),
                  //volume
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
