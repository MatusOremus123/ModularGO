import 'dart:async';
import 'package:flutter/material.dart';
import 'second_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SecondPage()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Image.asset(
          'assets/MODULAR.png',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
