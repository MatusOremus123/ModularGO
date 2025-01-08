import 'dart:async';
import 'package:flutter/material.dart';
import 'second_page.dart'; // Import the second page file

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigate to the next page after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SecondPage()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.red, // Background color
      body: Center(
        child: Image.asset(
          'assets/MODULAR.png', // Path to your PNG file
          width: 200, // Adjust the width
          height: 200, // Adjust the height
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
