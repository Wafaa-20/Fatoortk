import 'package:fatoortk/core/database/cache/cache_helper.dart';
import 'package:fatoortk/core/functions/navigation.dart';
import 'package:fatoortk/core/images/app_assets.dart';
import 'package:fatoortk/core/services/service_locator.dart';
import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/core/text/text_styles.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    bool isOnboardingVisited =
        getIt<CacheHelper>().getData(key: 'isOnboardingVisited') ?? false;
    if (isOnboardingVisited == true) {
      delayedNavigate(context, '/login');
    } else {
      delayedNavigate(context, '/onboarding');
    }
  }

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

  void delayedNavigate(context, path) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          customReplacementNavigate(context, path);
        }
      },
    );
  }
}
