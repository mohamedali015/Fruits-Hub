import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.mostSelling,
          style: AppTextStyles.bold16,
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            AppStrings.more,
            style: AppTextStyles.regular13.copyWith(
              color: AppColors.gray400,
            ),
          ),
        ),
      ],
    );
  }
}
