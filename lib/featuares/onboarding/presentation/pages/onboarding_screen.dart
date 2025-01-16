import 'package:fatoortk/core/theme/app_color.dart';
import 'package:fatoortk/core/widgets/custom_btn.dart';
import 'package:fatoortk/core/widgets/text_btn.dart';
import 'package:fatoortk/featuares/onboarding/presentation/widget/onboarding_body.dart';
import 'package:fatoortk/featuares/onboarding/presentation/widget/smooth_page_indecator.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController(initialPage: 0);

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
            child: TextBtn(text: 'Skip'),
          ),
          OnboardingBody(controller: controller),
          SmoothPageIndecator(controller: controller),

          const SizedBox(height: 35),
          const CustomBtn(text: 'Next'),
          // const SizedBox(height: 17),
        ]),
      ),
    ));
  }
}
