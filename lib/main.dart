import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const CampusCrowdApp());
}

class CampusCrowdApp extends StatelessWidget {
  const CampusCrowdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Crowd',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: const SplashScreen(),
    );
  }
}