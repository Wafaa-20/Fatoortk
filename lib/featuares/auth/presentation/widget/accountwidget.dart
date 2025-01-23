import 'package:fatoortk/core/text/text_styles.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key, required this.text1, required this.text2});

  final String text1;
  final String text2;

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
        ),
      ]),
    );
  }
}
