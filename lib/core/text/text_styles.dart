import 'package:fatoortk/core/theme/app_color.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static const titel = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w900,
    height: 1.21,
    color: AppColor.text1,
  );
  static const brand1 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    height: 1.22,
    color: AppColor.button,
    fontFamily: 'Oxanium',
  );
  static const brand2 = TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.bold,
    height: 1.0,
    color: AppColor.button,
    fontFamily: 'Cairo',
  );

  static const subTitel = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColor.text2,
      fontFamily: 'Inter');

  static const textBtn = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColor.background2,
      fontFamily: 'Inter');
}
