import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/loading/isLoading.dart';
import 'package:islami_app/tabs/hadeth/hadeth.dart';
import 'package:islami_app/tabs/hadeth/hadeth_details.dart';
import 'package:islami_app/theme_app.dart';

class HadethItem extends StatefulWidget {
  final int index;

  const HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;
  @override
  Widget build(BuildContext context) {
    if (hadeth == null) {
      hadethLoad();
    }
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(HadethDetails.routName, arguments: hadeth);
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/hadeth_card.png"),
          ),
          color: ThemeApp.primary,
          borderRadius: BorderRadius.circular(20.r),
        ),
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 20),
        padding: EdgeInsets.only(top: 12, left: 8, right: 8),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/hadeth_header_left.png",
                  width: 90.w,
                  height: 90.h,
                  fit: BoxFit.fill,
                ),
                if (hadeth != null)
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      hadeth!.title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ThemeApp.black,
                        fontSize: 23.sp,
                      ),
                    ),
                  ),
                Image.asset(
                  "assets/images/hadeth_header_right.png",
                  width: 90.w,
                  height: 90.h,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            Expanded(
              child: hadeth == null
                  ? Isloading(color: ThemeApp.black)
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      itemCount: hadeth!.content.length,
                      itemBuilder: (context, index) => Text(
                        textAlign: TextAlign.center,
                        hadeth!.content[index],
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(color: ThemeApp.black),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> hadethLoad() async {
    String hadethcontain = await rootBundle.loadString(
      "assets/hadeth/h${widget.index + 1}.txt",
    );
    List<String> hadethLine = hadethcontain.split("\n");
    String title = hadethLine[0];
    hadethLine.removeAt(0);
    List<String> content = hadethLine;
    hadeth = Hadeth(title: title, content: content, num: widget.index + 1);
    setState(() {});
  }
}
