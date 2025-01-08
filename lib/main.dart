import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Import the splash screen
import 'screens/second_page.dart'; // Import vending machines page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Set splash screen as the first page
    );
  }
}
