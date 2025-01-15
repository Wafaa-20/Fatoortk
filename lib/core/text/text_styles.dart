import 'package:fatoortk/core/theme/app_color.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static const titel = TextStyle(
    // fontSize: 28,
    // fontWeight: FontWeight.bold,
    // color: AppColor.text1,

    // fontFamily: 'Inter'
    fontSize: 25, // حجم الخط 24px
    fontWeight: FontWeight.w900, // وزن الخط 900
    height: 1.21, // ارتفاع السطر (29.05 ÷ 24 = 1.21 تقريباً)
    color: AppColor.text1,
    
  );

  static const subTitel = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColor.text2,
      fontFamily: 'Inter');
}
