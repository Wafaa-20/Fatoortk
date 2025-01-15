import 'package:fatoortk/core/text/app_text.dart';

class OnboardingOptionsModel {
  final String title;
  final String subTitle;
  final List<String> option;

  OnboardingOptionsModel(
      {required this.title, required this.subTitle, required this.option});
}

List<OnboardingOptionsModel> optionData = [
  OnboardingOptionsModel(
      title: AppText.onboardingTitle3,
      subTitle: AppText.onboardingSubTitle3,
      option: [
        "Lost the receipt",
        "Cant read the receipts",
        "The ink disappears ",
        "Forget to get a receipt",
        "Forget the Services",
        "Loos the warranty information",
        "Forget the warranty"
      ])
];
