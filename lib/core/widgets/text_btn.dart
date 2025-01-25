import 'package:fatoortk/core/text/text_styles.dart';
import 'package:fatoortk/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  const TextBtn({super.key, required this.text, this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyles.inter14grey.copyWith(
          color: AppColor.button,
        ),
      ),
    );
  }
}
