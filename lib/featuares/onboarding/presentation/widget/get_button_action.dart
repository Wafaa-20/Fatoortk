import 'package:fatoortk/core/database/cache/cache_helper.dart';
import 'package:fatoortk/core/functions/navigation.dart';
import 'package:fatoortk/core/services/service_locator.dart';
import 'package:fatoortk/core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class GetButtonAction extends StatelessWidget {
  const GetButtonAction(
      {super.key,
      required this.controller,
      required this.currentIndex,
      required this.lastPageIndex});
  final PageController controller;
  final int currentIndex;
  final int lastPageIndex;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == lastPageIndex) {
      return CustomBtn(
        text: 'Start',
        onPressed: () {
          serviceLocator<CacheHelper>()
              .saveData(key: 'isOnboardingVisited', value: true);
          customNavigate(context, "/login");
        },
      );
    } else {
      return CustomBtn(
        text: 'Next',
        onPressed: () {
          controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      );
    }
  }
}
