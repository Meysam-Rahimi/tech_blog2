import 'package:flutter/material.dart';
import 'package:tech_blog/main_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initstate() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/logo.png"),
                height: 70,
              ),
              SizedBox(height: 32),
              SpinKitCircle(
                color: SolidColors.primaryColor,
                size: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
