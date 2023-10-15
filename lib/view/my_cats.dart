import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/my_strings.dart';

class MyCats extends StatelessWidget {
  const MyCats({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textThem = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  'assets/images/tcbot.svg',
                  height: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(MyStrings.successfulRegistration,
                    style: textThem.headlineMedium),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: 'نام و نام خانوادگی',
                      hintStyle: textThem.labelMedium),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(MyStrings.chooseCats, style: textThem.headlineMedium),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
