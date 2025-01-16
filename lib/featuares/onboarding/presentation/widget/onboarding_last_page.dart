import 'package:fatoortk/core/text/text_styles.dart';
import 'package:fatoortk/featuares/onboarding/data/models/onboarding_options_model.dart';
import 'package:fatoortk/featuares/onboarding/presentation/bloc/checkbox_cubit%20.dart';
import 'package:fatoortk/featuares/onboarding/presentation/widget/checkbox/checkbox_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingOptions extends StatelessWidget {
  const OnboardingOptions(
      {super.key, required this.data, required this.controller});

  final OnboardingOptionsModel data;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckboxCubit(data),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.title, style: TextStyles.titel),
          const SizedBox(height: 15),
          Text(data.subTitle, style: TextStyles.subTitel),
          const SizedBox(height: 30),
          CheckboxOnbording(data: data),
        ],
      ),
    );
  }
}
