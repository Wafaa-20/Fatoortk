import 'package:fatoortk/core/theme/app_color.dart';
import 'package:fatoortk/featuares/splash/presentation/widget/splash_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background1,
        body: Center(
          child: SplashBody(),
        ),
      ),
    );
  }
}
