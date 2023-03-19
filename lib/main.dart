import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:imense/PrincipalPages/BasedPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            //TODO:check color
            color: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        duration: 750,
        animationDuration: const Duration(milliseconds: 250),
        splash: Image.asset(
          'lib/assets/spleshScreen.png',
          fit: BoxFit.cover,
        ),
        splashIconSize: double.maxFinite,
        nextScreen: Builder(builder: (context) {
          //switch to another StatefulWidget in order to work with setState((){})
          return const BasedPage();
        }),
      ),
    );
  }
}
