import 'package:flutter/material.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/view/home_screen.dart';
import 'package:tech_blog/view/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    List<Widget> techMainScreenPages = [
      HomeScreen(size: size, bodyMargin: bodyMargin),
      ProfileScreen(size: size, bodyMargin: bodyMargin),
    ];

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
                  child: techMainScreenPages[selectedPageIndex]),
            ),

            // bottom navigaton bar
            BottomNavigationBar(
              size: size,
              bodyMargin: bodyMargin,
              changeScreen: (int value) {
                setState(() {
                  selectedPageIndex = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  });

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

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
                      onPressed: (() => changeScreen(0)),
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
                      onPressed: (() => changeScreen(1)),
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
