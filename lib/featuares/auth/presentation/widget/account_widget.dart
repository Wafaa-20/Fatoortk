import 'package:fatoortk/core/text/text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AccountTextWidget extends StatelessWidget {
  const AccountTextWidget(
      {super.key, required this.text1, required this.text2, this.onTap});

  final String text1;
  final String text2;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: text1,
          style: TextStyles.inter14grey,
        ),
        TextSpan(
          text: text2,
          style: TextStyles.inter14blue,
          recognizer: TapGestureRecognizer()..onTap = onTap,
        ),
      ]),
    );
  }
}
