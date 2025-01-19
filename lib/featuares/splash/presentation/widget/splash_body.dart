import 'package:fatoortk/core/images/app_assets.dart';
import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/core/text/text_styles.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 280,
          width: 290,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.assetsImageLogo),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(AppText.splashBrand1, style: TextStyles.brand1),
        const Text(AppText.splashBrand2, style: TextStyles.brand2),
      ],
    );
  }
}
