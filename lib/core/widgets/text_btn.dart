import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  const TextBtn({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: Text(text));
  }
}
