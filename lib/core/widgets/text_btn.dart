import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  const TextBtn({super.key, required this.text, this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(text));
  }
}
