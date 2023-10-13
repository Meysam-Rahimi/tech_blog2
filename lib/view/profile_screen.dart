import 'package:flutter/material.dart';

import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_strings.dart';
import 'package:tech_blog/view/my_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/profileAvatar.png'),
              height: 90,
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage('assets/icons/blue_pen.png'),
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  MyStrings.imageProfileEdit,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),

            const Text(
              'Sami Rahimi',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'datataday023@gmail.com',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            // خط بین ردیف ها / divider
            TechDivider(size: size),
            InkWell(
              onTap: (() {}),
              splashColor: SolidColors.primaryColor,
              child: const SizedBox(
                  height: 45,
                  child: Center(child: Text(MyStrings.myFavPodcast))),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: (() {}),
              splashColor: SolidColors.primaryColor,
              child: const SizedBox(
                  height: 45, child: Center(child: Text(MyStrings.myFavBlog))),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: (() {}),
              splashColor: SolidColors.primaryColor,
              child: const SizedBox(
                  height: 45, child: Center(child: Text(MyStrings.logOut))),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
