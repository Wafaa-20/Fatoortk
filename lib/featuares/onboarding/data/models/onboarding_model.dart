import 'package:fatoortk/core/text/app_text.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String subTitle;

  OnboardingModel(
      {required this.image, required this.title, required this.subTitle});
}

List<OnboardingModel> onbordingData = [
  OnboardingModel(
    image: 'asset/image/logo.png',
    title: AppText.onboardingTitle1,
    subTitle: AppText.onboardingSubTitle1,
  ),
  OnboardingModel(
    image: 'asset/image/logo.png',
    title: AppText.onboardingTitle2,
    subTitle: AppText.onboardingSubTitle2,
  ),
];
