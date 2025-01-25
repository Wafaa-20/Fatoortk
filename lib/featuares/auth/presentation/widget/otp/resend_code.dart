import 'package:fatoortk/core/text/app_text.dart';
import 'package:fatoortk/core/widgets/text_btn.dart';
import 'package:flutter/material.dart';

class ResendCode extends StatelessWidget {
  const ResendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return TextBtn(
      text: AppText.resendCode,
      onPressed: () {},
    );
  }
}
