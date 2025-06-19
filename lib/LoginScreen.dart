// lib/login_screen.dart
// This file defines the LoginScreen widget, serving as a placeholder
// for the user authentication interface.

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        // 'automaticallyImplyLeading: false' removes the back button from the AppBar.
        // This is desirable after a splash screen transition.
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically.
          children: [
            const Text(
              'Welcome to the Login Screen!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), // Spacer.
            // Username Input Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded borders.
                  ),
                  prefixIcon: const Icon(Icons.person), // Icon inside the text field.
                ),
              ),
            ),
            const SizedBox(height: 15), // Spacer.
            // Password Input Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                obscureText: true, // Hides the input text for passwords.
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: const Icon(Icons.lock), // Icon inside the text field.
                ),
              ),
            ),
            const SizedBox(height: 20), // Spacer.
            // Login Button
            ElevatedButton(
              onPressed: () {
                // TODO: Implement your actual login authentication logic here.
                // This is where you would typically validate user input,
                // call an authentication service, and navigate to the home screen
                // upon successful login.
                print('Login button pressed!'); // Placeholder action for now.
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded button corners.
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
