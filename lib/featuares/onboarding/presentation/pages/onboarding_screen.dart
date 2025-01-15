import 'package:fatoortk/core/theme/app_color.dart';
import 'package:fatoortk/core/widgets/text_btn.dart';
import 'package:fatoortk/featuares/onboarding/presentation/widget/onboarding_body.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.background2,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          const Align(
            alignment: Alignment.topRight,
            child: TextBtn(
              text: 'Skip',
            ),
          ),
          OnboardingBody(),
        ]),
      ),
    ));
  }
}
