import 'package:fatoortk/core/images/app_assets.dart';
import 'package:flutter/material.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 311,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(Assets.welcomeBanner),
        fit: BoxFit.fill,
      )),
    );
  }
}
