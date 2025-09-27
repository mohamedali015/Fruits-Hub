import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/features/on_boarding/view/widgets/page_view_item.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../manager/on_boarding_cubit.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = OnBoardingCubit.get(context);
    return PageView(
      controller: cubit.pageController,
      onPageChanged: (index) {
        cubit.changePage(index);
      },
      children: [
        PageViewItem(
          visible: true,
          image: AppAssets.onBoardingImage1,
          backgroundImage: AppAssets.onBoardingBackground1,
          subTitle: AppStrings.onBoardingSubTitle1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.onBoardingTitle1,
                style: AppTextStyles.bold23,
              ),
              Text(
                "HUB",
                style:
                    AppTextStyles.bold23.copyWith(color: AppColors.secondary),
              ),
              Text(
                "Fruits",
                style: AppTextStyles.bold23.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ),
        PageViewItem(
          visible: false,
          image: AppAssets.onBoardingImage2,
          backgroundImage: AppAssets.onBoardingBackground2,
          title: Text(AppStrings.onBoardingTitle2, style: AppTextStyles.bold23),
          subTitle: AppStrings.onBoardingSubTitle2,
        ),
      ],
    );
  }
}
