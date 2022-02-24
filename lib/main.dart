// @dart=2.9
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'index.dart';

// import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashPage();
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(
          useLoader: false,
          seconds: 5,
          imageBackground: const AssetImage("assets/Images/Splash4.png"),
          navigateAfterSeconds: const Index(),
        ),
      ),
    );
  }
}
