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
    return SizedBox(
      height: 650,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(children: [
            Container(
              height: 374,
              width: 382,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 15),
            SmoothPageIndecator(
              controller: controller,
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyles.titel,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subTitle,
                style: TextStyles.subTitel,
                textAlign: TextAlign.right,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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
