import 'package:flutter/material.dart';
import '../helper/my_responsive.dart';

abstract class AppTextStyles {
  // ---------- Regular ----------
  static TextStyle regular11 = TextStyle(
    fontSize: MyResponsive.fontSize(value: 11),
    fontWeight: FontWeight.normal,
  );

  static TextStyle regular13 = TextStyle(
    fontSize: MyResponsive.fontSize(value: 13),
    fontWeight: FontWeight.normal,
  );

  static TextStyle regular16 = TextStyle(
    fontSize: MyResponsive.fontSize(value: 16),
    fontWeight: FontWeight.normal,
  );

  static TextStyle regular22 = TextStyle(
    fontSize: MyResponsive.fontSize(value: 22),
    fontWeight: FontWeight.normal,
  );

  static TextStyle regular26 = TextStyle(
    fontSize: MyResponsive.fontSize(value: 26),
    fontWeight: FontWeight.normal,
  );

  // ---------- Medium ----------
  static TextStyle medium15 = TextStyle(
    fontSize: MyResponsive.fontSize(value: 15),
    fontWeight: FontWeight.w500,
  );

  // ---------- SemiBold ----------
  static TextStyle semiBold11 = TextStyle(
    fontSize: MyResponsive.fontSize(value: 11),
    fontWeight: FontWeight.w600,
  );

  static TextStyle semiBold13 = TextStyle(
    fontSize: MyResponsive.fontSize(value: 13),
    fontWeight: FontWeight.w600,
  );

  static TextStyle semiBold16 = TextStyle(
    fontSize: MyResponsive.fontSize(value: 16),
    fontWeight: FontWeight.w600,
  );

  // ---------- Bold ----------
  static TextStyle bold13 = TextStyle(
    fontSize: MyResponsive.fontSize(value: 13),
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold16 = TextStyle(
    fontSize: MyResponsive.fontSize(value: 16),
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold19 = TextStyle(
    fontSize: MyResponsive.fontSize(value: 19),
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold23 = TextStyle(
    fontSize: MyResponsive.fontSize(value: 23),
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold28 = TextStyle(
    fontSize: MyResponsive.fontSize(value: 28),
    fontWeight: FontWeight.bold,
  );
}
