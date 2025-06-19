// lib/splash_screen.dart
// This file defines the SplashScreen widget, which displays a splash screen
// for a fixed duration and then navigates to the login screen.

import 'package:flutter/material.dart';
import 'dart:async'; // Required for Future.delayed

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Call the navigation function as soon as the widget is initialized.
    _navigateToLogin();
  }

  // Asynchronously waits for 5 seconds and then navigates to the login screen.
  void _navigateToLogin() async {
    // Wait for 5 seconds (5000 milliseconds) before proceeding.
    await Future.delayed(const Duration(seconds: 5));

    // Ensure the widget is still mounted before attempting to navigate.
    // This prevents errors if the user leaves the screen before the delay finishes.
    if (mounted) {
      // Navigate to the '/login' route and replace the current route.
      // 'pushReplacementNamed' removes the splash screen from the navigation stack,
      // so the user cannot use the back button to return to it.
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    // The Scaffold provides the basic visual structure for a Material Design app.
    return Scaffold(
      body: Container(
        // Ensure the container fills the entire screen width and height.
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          // Example: A simple linear gradient background for visual appeal.
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          // Center the content within the container.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Vertically center the children.
            children: [
              // Application logo or icon.
              Icon(
                Icons.flutter_dash, // Example Flutter icon. Replace with your app icon.
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 20), // Spacing between the icon and text.
              Text(
                'Welcome to My App!', // Your app's welcome message.
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10), // Spacing between the text and indicator.
              CircularProgressIndicator(
                // A loading indicator to show progress.
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
