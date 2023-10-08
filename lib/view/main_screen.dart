import 'package:flutter/material.dart';

import 'package:tech_blog/my_colors.dart';

import 'package:tech_blog/view/home_screen.dart';
import 'package:tech_blog/view/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: SolidColors.scaffoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.menu, color: Colors.black),
              Image(
                height: size.height / 13.6,
                image: const AssetImage("assets/images/logo.png"),
              ),
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: Positioned.fill(
                  child: ProfileScreen(size: size, bodyMargin: bodyMargin)),
            ),

            // bottom navigaton bar
            bottomNavigationBar(size: size, bodyMargin: bodyMargin),
          ],
        ),
      ),
    );
  }
}

class bottomNavigationBar extends StatelessWidget {
  const bottomNavigationBar({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 0,
      left: 0,
      child: Container(
          height: size.height / 10,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: GradientColors.bottomNavBackground,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: Container(
              height: size.height / 8,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(colors: GradientColors.bottomNav),
              ),

              // navBar icon buttons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const ImageIcon(
                        AssetImage(
                          'assets/icons/home.png',
                        ),
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const ImageIcon(
                        AssetImage(
                          'assets/icons/write.png',
                        ),
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const ImageIcon(
                        AssetImage(
                          'assets/icons/user.png',
                        ),
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          )),
    );
  }
}
