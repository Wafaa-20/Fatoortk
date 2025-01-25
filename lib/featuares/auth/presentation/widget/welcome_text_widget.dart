import 'package:fatoortk/core/text/text_styles.dart';
import 'package:flutter/material.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({
    super.key,
    required this.text,
    this.text2,
  });

  final String text;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyles.inter20black,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text2 ?? '',
          style: TextStyles.inter16grey,
        ),
      ],
    );
  }
}
