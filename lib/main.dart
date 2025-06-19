// lib/main.dart
// This file is the entry point of the Flutter application.
// It sets up the MaterialApp and defines the application's routes.

import 'package:flutter/material.dart';
// Import the custom splash_screen and login_screen widgets
import 'package:personal_finance_tracker/SplashScreen.dart';
import 'package:personal_finance_tracker/LoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Define the named routes for the application.
      // The initialRoute specifies which route to display first.
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(), // The splash screen
        '/login': (context) => const LoginScreen(), // The login screen
      },
      debugShowCheckedModeBanner: false, // Hides the debug banner for a cleaner UI
    );
  }
}
