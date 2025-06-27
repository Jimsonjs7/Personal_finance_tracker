import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:personal_finance_tracker/providers/currency_provider.dart';
import 'package:personal_finance_tracker/HomeScreen.dart';
import 'package:personal_finance_tracker/SettingsPage.dart';
import 'package:personal_finance_tracker/firebase_options.dart';
import 'package:personal_finance_tracker/SplashScreen.dart';
import 'package:personal_finance_tracker/LoginScreen.dart';
import 'package:personal_finance_tracker/auth/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrencyProvider()),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(firebase_auth.FirebaseAuth.instance, GoogleSignIn())..checkAuthStatus(),
        ),
      ],
      child: MyAppTheme(key: MyAppTheme.appKey), // ✅ Assign GlobalKey
    ),
  );
}

// ✅ Theme-aware App
class MyAppTheme extends StatefulWidget {
  const MyAppTheme({super.key});

  static final GlobalKey<_MyAppThemeState> appKey = GlobalKey<_MyAppThemeState>();

  static void toggleTheme(bool isDark) {
    appKey.currentState?.toggleTheme(isDark);
  }

  @override
  State<MyAppTheme> createState() => _MyAppThemeState();
}

class _MyAppThemeState extends State<MyAppTheme> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
    _loadSavedTheme();
  }

  Future<void> _loadSavedTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDarkTheme') ?? false;
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', isDark);
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Finance Tracker',
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal, brightness: Brightness.dark),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/xoxo': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/': (context) => HomeScreen(),
        '/settings': (context) => SettingsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
