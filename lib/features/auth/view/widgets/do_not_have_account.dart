import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/my_responsive.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class DoNotHaveAccount extends StatelessWidget {
  final String question;
  final String actionText;
  final VoidCallback onPressed;

  const DoNotHaveAccount({
    super.key,
    required this.question,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: AppTextStyles.semiBold16.copyWith(color: AppColors.gray400),
        ),
        SizedBox(
          width: MyResponsive.width(value: 10),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            actionText,
            style: AppTextStyles.semiBold16.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
