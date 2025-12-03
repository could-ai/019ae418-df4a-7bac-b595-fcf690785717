import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'screens/home_screen.dart';
import 'screens/donate_screen.dart';
import 'screens/about_screen.dart';

void main() {
  runApp(const MolandMissionApp());
}

class MolandMissionApp extends StatelessWidget {
  const MolandMissionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moland Mission Uganda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32), // Green 800
          secondary: const Color(0xFFEF6C00), // Orange 800
          surface: const Color(0xFFF5F5F5),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xFF2E7D32),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFEF6C00),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/home': (context) => const HomeScreen(),
        '/donate': (context) => const DonateScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
