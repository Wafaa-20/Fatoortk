import 'package:fatoortk/core/text/text_styles.dart';
import 'package:fatoortk/featuares/onboarding/data/models/onboarding_model.dart';
import 'package:fatoortk/featuares/onboarding/data/models/onboarding_options_model.dart';
import 'package:fatoortk/featuares/onboarding/presentation/widget/onboarding_last_page.dart';
import 'package:flutter/material.dart';

class OnboardingBody extends StatelessWidget {
  final PageController controller;
  const OnboardingBody({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 545,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        itemCount: onbordingData.length + 1,
        itemBuilder: (context, index) {
          if (index < onbordingData.length) {
            return Column(children: [
              Container(
                height: 374,
                width: 382,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(onbordingData[index].image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  onbordingData[index].title,
                  style: TextStyles.titel,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 15),
                Text(
                  onbordingData[index].subTitle,
                  style: TextStyles.subTitel,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 40),
              ]),
            ]);
          } else {
            return OnboardingOptions(
              data: optionData[0],
              controller: controller,
            );
          }
        },
      ),
    );
  }
}
