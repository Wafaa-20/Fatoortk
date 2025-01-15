import 'package:fatoortk/core/text/text_styles.dart';
import 'package:fatoortk/core/widgets/custom_btn.dart';
import 'package:fatoortk/featuares/onboarding/data/models/onboarding_options_model.dart';
import 'package:fatoortk/featuares/onboarding/presentation/bloc/checkbox_cubit%20.dart';
import 'package:fatoortk/featuares/onboarding/presentation/widget/checkbox_onbording.dart';
import 'package:fatoortk/featuares/onboarding/presentation/widget/smooth_page_indecator.dart';
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
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              data.title,
              style: TextStyles.titel,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              data.subTitle,
              style: TextStyles.subTitel,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 30),
          CheckboxOnbording(
            data: data,
          ),
          SmoothPageIndecator(
            controller: controller,
          ),
          const SizedBox(height: 20),
          const CustomBtn(
            text: 'Start',
          ),
        ],
      ),
    );
  }
}
