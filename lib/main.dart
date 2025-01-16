// import 'package:fatoortk/featuares/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

import 'featuares/onboarding/presentation/pages/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
