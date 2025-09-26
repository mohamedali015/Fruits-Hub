import 'package:flutter/material.dart';

import '../helper/my_responsive.dart';
import 'app_colors.dart';

abstract class AppFontStyles {
  static TextStyle textF14({
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(value: 14),
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle textF16({
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(value: 16),
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle textF18({
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(value: 18),
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle textF20({
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(value: 20),
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle textF30({
    Color color = AppColors.white,
  }) =>
      TextStyle(
        fontSize: MyResponsive.fontSize(value: 30),
        fontWeight: FontWeight.w600,
        // fontFamily: AppConstants.fontFamily,
        color: color,
      );
}
