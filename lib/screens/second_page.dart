import 'dart:async';
import 'package:flutter/material.dart';
import 'before_login_screen.dart';  // Import the BeforeLoginScreen

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Automatically navigate to BeforeLoginScreen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BeforeLoginScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white, // Background color
      body: Center(
        child: Image.asset(
          'assets/Welcome - 2.png', // Replace with your background image
          fit: BoxFit.cover, // Cover the entire screen
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}