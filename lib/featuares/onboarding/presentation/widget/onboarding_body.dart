import 'package:fatoortk/core/text/text_styles.dart';
import 'package:fatoortk/core/widgets/custom_btn.dart';
import 'package:fatoortk/featuares/onboarding/data/models/onboarding_model.dart';
import 'package:fatoortk/featuares/onboarding/data/models/onboarding_options_model.dart';
import 'package:fatoortk/featuares/onboarding/presentation/widget/onboarding_options.dart';
import 'package:fatoortk/featuares/onboarding/presentation/widget/smooth_page_indecator.dart';
import 'package:flutter/material.dart';

class OnboardingBody extends StatelessWidget {
  OnboardingBody({super.key});

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650,
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
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  onbordingData[index].title,
                  style: TextStyles.titel,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  onbordingData[index].subTitle,
                  style: TextStyles.subTitel,
                  textAlign: TextAlign.right,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 30),
              SmoothPageIndecator(
                controller: controller,
              ),
              const SizedBox(height: 60),
              const CustomBtn(
                text: 'Next',
              ),
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
