import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color
      body: Center(
        child: Image.asset(
          'assets/Welcome - 2.png', // Replace with the path to your background image
          fit: BoxFit.cover, // Cover the entire screen
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
