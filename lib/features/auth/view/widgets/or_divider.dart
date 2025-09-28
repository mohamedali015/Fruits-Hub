import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/my_responsive.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

import '../../../../core/utils/app_strings.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.borderColor,
          ),
        ),
        Padding(
          padding: MyResponsive.paddingSymmetric(horizontal: 18),
          child: Text(AppStrings.or, style: AppTextStyles.semiBold16),
        ),
        Expanded(
          child: Divider(
            thickness: MyResponsive.height(value: 1),
            color: AppColors.borderColor,
          ),
        ),
      ],
    );
  }
}
