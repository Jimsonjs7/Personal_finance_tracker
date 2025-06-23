// lib/SplashScreen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance_tracker/auth/auth_cubit.dart';
import 'package:personal_finance_tracker/auth/auth_state.dart';
import 'dart:async'; // Add this line

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Define a Completer to signal when the minimum splash time is over
  final _splashMinimumDurationCompleter = Completer<void>();

  @override
  void initState() {
    super.initState();
    // Start a timer for the minimum splash screen duration
    Future.delayed(const Duration(seconds: 5), () { // Changed from 3 to 5 seconds for example
      _splashMinimumDurationCompleter.complete(); // Signal that the minimum time is up
    });

    // Ensure AuthStatusRequested is dispatched to immediately start checking auth status
    // This was implicitly handled by `checkAuthStatus()` in main.dart, but explicitly calling it here
    // after the build context is available ensures state emission.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthCubit>().checkAuthStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) async {
          // Wait for the minimum splash duration to complete
          await _splashMinimumDurationCompleter.future;

          // Now, perform navigation based on the authentication state
          if (state is AuthSuccess) {
            print('User is authenticated: ${state.user.email}');
            // TODO: Replace with navigation to your main app content/home screen
            Navigator.of(context).pushReplacementNamed('/login'); // Still navigate to login for now
          } else if (state is AuthUnauthenticated) {
            Navigator.of(context).pushReplacementNamed('/login');
          } else if (state is AuthFailure) {
            print('Auth error on splash: ${state.error}');
            Navigator.of(context).pushReplacementNamed('/login');
          }
        },
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.attach_money,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Text(
                'Personal Finance Tracker',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}