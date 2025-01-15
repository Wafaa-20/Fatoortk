import 'package:fatoortk/core/text/text_styles.dart';
import 'package:fatoortk/core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

import 'smooth_page_indecator.dart';

class OnboardingBody extends StatelessWidget {
  OnboardingBody({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image, title, subTitle;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(children: [
            Image.asset(image),
            const SizedBox(height: 15),
            SmoothPageIndecator(
              controller: controller,
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: TextStyles.titel,
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subTitle,
                style: TextStyles.subTitel,
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(height: 80),
            const CustomBtn(
              text: 'Next',
            ),
          ]);
        },
      ),
    );
  }
}
