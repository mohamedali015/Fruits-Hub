import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/my_responsive.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

import 'on_boarding_images_stack_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.subTitle,
    required this.visible,
  });

  final String image, backgroundImage, subTitle;
  final Widget title;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnBoardingImagesStackView(
          visible: visible,
          backgroundImage: backgroundImage,
          image: image,
        ),
        SizedBox(height: MyResponsive.height(value: 64)),
        title,
        SizedBox(height: MyResponsive.height(value: 24)),
        Padding(
          padding: MyResponsive.paddingSymmetric(horizontal: 37),
          child: Text(
            subTitle,
            style: AppTextStyles.semiBold13.copyWith(color: AppColors.gray),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
