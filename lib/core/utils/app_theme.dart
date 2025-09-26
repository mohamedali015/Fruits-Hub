import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_constrains.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
    scaffoldBackgroundColor: AppColors.primary,
    brightness: Brightness.dark,
  );
}
