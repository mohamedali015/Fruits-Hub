import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

import '../helper/my_responsive.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        minimumSize: Size(
          double.infinity,
          MyResponsive.height(value: 54),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MyResponsive.radius(value: 16)),
        ),
      ),
      child: Text(
        title,
        style: AppTextStyles.bold16,
      ),
    );
  }
}
