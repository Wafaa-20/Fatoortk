import 'package:fatoortk/core/theme/app_color.dart';
import 'package:fatoortk/core/widgets/custom_btn.dart';
import 'package:fatoortk/core/widgets/text_btn.dart';
import 'package:fatoortk/featuares/onboarding/data/models/onboarding_model.dart';
import 'package:fatoortk/featuares/onboarding/presentation/widget/onboarding_body.dart';
import 'package:fatoortk/featuares/onboarding/presentation/widget/smooth_page_indecator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.background2,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          Align(
            alignment: Alignment.topRight,
            child: TextBtn(
              text: 'Skip',
              onPressed: () => context.go("/login"),
            ),
          ),
          OnboardingBody(
            controller: controller,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          SmoothPageIndecator(controller: controller),

          const SizedBox(height: 35),
          currentIndex == onbordingData.length
              ? CustomBtn(
                  text: 'Start',
                  onPressed: () => context.go("/login"),
                )
              : CustomBtn(
                  text: 'Next',
                  onPressed: () {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
          // const SizedBox(height: 17),
        ]),
      ),
    ));
  }
}
