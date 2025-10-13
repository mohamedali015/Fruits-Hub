import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';

import '../../../../core/helper/my_responsive.dart';
import '../../../../core/shared_widgets/svg_wrapper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(AppAssets.profileImage),
      title: Text(
        AppStrings.goodMorning,
        style: AppTextStyles.regular16.copyWith(color: AppColors.gray400),
      ),
      subtitle: Text(
        "Mohamed Ali",
        style: AppTextStyles.bold16,
      ),
      trailing: Container(
        padding: MyResponsive.paddingAll(value: 12),
        decoration: BoxDecoration(
          color: AppColors.darkWhite,
          shape: BoxShape.circle,
        ),
        child: SvgWrapper(path: AppAssets.notification),
      ),
    );
  }
}
