// lib/main.dart

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth; // Import Firebase Auth
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc
import 'package:google_sign_in/google_sign_in.dart'; // <<< NEW IMPORT FOR GOOGLE SIGN IN

import 'package:personal_finance_tracker/firebase_options.dart';
import 'package:personal_finance_tracker/Splashscreen.dart';
import 'package:personal_finance_tracker/Loginscreen.dart';


// Import your Auth Cubit
import 'package:personal_finance_tracker/auth/auth_cubit.dart';
import 'package:personal_finance_tracker/auth/auth_state.dart'; // Import AuthState to use in MyApp (optional but good practice)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyAppWrapper()); // Wrap MyApp with MyAppWrapper to provide the Cubit
}

// A new StatelessWidget to provide the AuthCubit
class MyAppWrapper extends StatelessWidget {
  const MyAppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Provide the AuthCubit to the entire application.
    // The AuthCubit requires instances of FirebaseAuth and GoogleSignIn.
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(
        firebase_auth.FirebaseAuth.instance,
        GoogleSignIn(), // <<< UPDATED: Pass GoogleSignIn instance here
      )..checkAuthStatus(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Finance Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        // We'll modify the SplashScreen to handle initial routing based on auth state
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        // You'll eventually add a '/home' route here for logged-in users
      },
      debugShowCheckedModeBanner: false,
    );
  }
}