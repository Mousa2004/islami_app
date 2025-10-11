import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/tabs/hadeth/hadeth.dart';
import 'package:islami_app/theme_app.dart';

class HadethDetails extends StatefulWidget {
  static const String routName = "/hadethDetails";
  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return Scaffold(
      backgroundColor: ThemeApp.black,
      appBar: AppBar(title: Text("Hadeth ${hadeth.num}")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/header_left.png",
                  height: 92.h,
                  width: 92.w,
                  fit: BoxFit.fill,
                ),
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    hadeth.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Image.asset(
                  "assets/images/header_right.png",
                  height: 92.h,
                  width: 92.w,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemBuilder: (context, index) => Text(
                textAlign: TextAlign.center,
                hadeth.content[index],
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: ThemeApp.primary),
              ),
              itemCount: hadeth.content.length,
            ),
          ),

          Image.asset("assets/images/footer.png", fit: BoxFit.fill),
        ],
      ),
    );
  }
}
