import 'package:fatoortk/core/text/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.hintText,
    this.prefixIcon,
    this.onChanged,
    this.onFieldSubmitted,
    required this.controller,
  });

  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyles.inter15labelText,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          validator: (value) {
            if (value!.isEmpty) {
              return '$hintText is missing';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyles.inter15hintText,
            prefixIcon: prefixIcon,
          ),
        ),
      ],
    );
  }
}
