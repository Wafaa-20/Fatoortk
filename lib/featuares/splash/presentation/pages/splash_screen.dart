import 'package:fatoortk/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 290,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/image/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "Fatoortak",
                style: TextStyle(
                  fontSize: 48,
                  fontFamily: "Oxanium",
                  fontWeight: FontWeight.bold,
                  color: AppColor.button,
                ),
              ),
              Text(
                "فاتورتك",
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                  color: AppColor.button,
                ),
              ),
            ],
          ),
        ));
  }
}
