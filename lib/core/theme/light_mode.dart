import 'package:fatoortk/core/text/text_styles.dart';
import 'package:fatoortk/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class LightMode {
  static final lightMode = ThemeData(
    scaffoldBackgroundColor: AppColor.background2,
    inputDecorationTheme: InputDecorationTheme(
      border: getBorderStyle(AppColor.unchecked),
      enabledBorder: getBorderStyle(AppColor.unchecked),
      focusedBorder: getBorderStyle(AppColor.button),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.button,
        textStyle: TextStyles.textBtn,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
  static final defaultPinTheme = pinTheme(AppColor.unchecked);
  static final focusedPinTheme = pinTheme(AppColor.button);

  static PinTheme pinTheme(Color color) {
    return PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(
        fontSize: 20,
        color: AppColor.dot,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static OutlineInputBorder getBorderStyle(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: borderColor, width: 2.0),
    );
  }
}
