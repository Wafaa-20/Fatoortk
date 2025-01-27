import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/core/text/text_styles.dart';
import 'package:fatoortk/featuares/auth/presentation/widget/singup/Terms%20And%20Conditions/custom_checkbox.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CustomCheckbox(),
        Expanded(
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                text: AppText.readAndAgree,
                style: TextStyles.inter14grey,
              ),
              TextSpan(
                  text: AppText.termsAndConditions,
                  style: TextStyles.inter14blue),
              TextSpan(
                text: AppText.andThe,
                style: TextStyles.inter14grey,
              ),
              TextSpan(
                  text: AppText.privacyPolicy, style: TextStyles.inter14blue),
            ]),
          ),
        ),
      ],
    );
  }
}
