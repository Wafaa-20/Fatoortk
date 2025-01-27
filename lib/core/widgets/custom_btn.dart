import 'package:fatoortk/core/text/text_styles.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.text, this.onPressed, this.color});

  final String text;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color ??
                Theme.of(context)
                    .elevatedButtonTheme
                    .style
                    ?.backgroundColor
                    ?.resolve({}),
          ),
          child: Text(text, style: TextStyles.textBtn)),
    );
  }
}
