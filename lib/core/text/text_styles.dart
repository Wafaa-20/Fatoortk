import 'package:fatoortk/core/theme/app_color.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static const titel = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w900,
    height: 1.21,
    color: AppColor.text1,
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
