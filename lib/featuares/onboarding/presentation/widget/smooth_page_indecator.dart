import 'package:fatoortk/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageIndecator extends StatelessWidget {
  const SmoothPageIndecator({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SmoothPageIndicator(
          controller: controller,
          count: 3,
          effect: const ExpandingDotsEffect(
            activeDotColor: AppColor.button,
            dotColor: AppColor.background1,
            dotWidth: 10,
            dotHeight: 8,
          )),
    );
  }
}
