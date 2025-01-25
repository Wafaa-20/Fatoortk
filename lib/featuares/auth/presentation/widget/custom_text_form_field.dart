import 'package:fatoortk/core/text/text_styles.dart';
import 'package:fatoortk/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      this.hintText,
      this.prefixIcon,
      this.onChanged,
      this.onFieldSubmitted});

  final String labelText;
  final String? hintText;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: TextStyles.inter15labelText),
        const SizedBox(height: 10),
        TextFormField(
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field is required';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyles.inter15hintText,
            border: getBorderStyle(AppColor.unchecked),
            enabledBorder: getBorderStyle(AppColor.unchecked),
            focusedBorder: getBorderStyle(AppColor.button),
            prefixIcon: prefixIcon,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder getBorderStyle(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: borderColor, width: 2.0),
    );
  }
}
