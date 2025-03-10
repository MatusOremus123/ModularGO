import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'providers/auth_provider.dart';
import 'services/order_service.dart';
import 'screens/splash_screen.dart';
import 'screens/second_page.dart';
import 'screens/code_confirmation_4.dart';  // Import your screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        Provider(create: (_) => OrderService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          '/second': (context) => SecondPage(),
          '/code-confirmation-4': (context) => CodeConfirmation4(), // Add this route
        },
      ),
    );
  }
}
