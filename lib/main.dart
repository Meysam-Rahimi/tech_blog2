import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/view/main_screen.dart';
import 'package:tech_blog/view/register_intro.dart';
// import 'package:tech_blog/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: SolidColors.statusBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: SolidColors.systemNavigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // farsi
      ],

      // themes
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        // elevated button
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return const TextStyle(
                  fontSize: 16,
                  fontFamily: 'dana',
                  fontWeight: FontWeight.w700,
                  color: SolidColors.posterTitle,
                );
              }
              return const TextStyle(
                fontSize: 15,
                fontFamily: 'dana',
                fontWeight: FontWeight.w300,
                color: SolidColors.posterSubTitle,
              );
            }),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return SolidColors.seeMore;
              }
              return SolidColors.primaryColor;
            }),
          ),
        ),

        fontFamily: 'dana',
        brightness: Brightness.light,
        hintColor: SolidColors.primaryColor,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontFamily: 'dana',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: SolidColors.posterTitle),
          titleMedium: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColors.posterSubTitle),
          bodyLarge: TextStyle(
              fontFamily: 'dana', fontSize: 13, fontWeight: FontWeight.w300),
          displayMedium: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w300),
          displaySmall: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: SolidColors.seeMore,
              fontWeight: FontWeight.w700),
          headlineMedium: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: Color.fromARGB(255, 70, 70, 70),
              fontWeight: FontWeight.w700),
          headlineSmall: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: SolidColors.hintText,
              fontWeight: FontWeight.w700),
        ),
      ),

      // home
      home: const SafeArea(
        child: Scaffold(
          // body: MainScreen(),
          body: RegisterIntro(),
        ),
      ),
    );
  }
}
