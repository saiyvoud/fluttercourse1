// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              margin:
                  const EdgeInsets.symmetric(vertical: 230, horizontal: 100),
              child: Lottie.asset(
                "assets/flutter_logo.json",
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "@Flutter Course ",
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
