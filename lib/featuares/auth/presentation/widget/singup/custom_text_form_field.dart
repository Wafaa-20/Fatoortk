import 'package:fatoortk/core/text/text_styles.dart';
import 'package:fatoortk/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.labelText, required this.hintText, this.onChanged, this.onFieldSubmitted});

  final String labelText;
  final String hintText;
  final  Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: TextStyles.inter15labelText),
          const SizedBox(height: 10),
          TextFormField(
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyles.inter15hintText,
              enabledBorder: getBorderStyle(AppColor.unchecked),
              focusedBorder: getBorderStyle(AppColor.button),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder getBorderStyle(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: borderColor, width: 2.0),
    );
  }
}
