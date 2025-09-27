import 'package:flutter/material.dart';
import 'package:fruits_hub/core/shared_widgets/svg_wrapper.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/features/on_boarding/manager/on_boarding_cubit.dart';

import '../../../../core/helper/my_responsive.dart';
import '../../../../core/utils/app_text_styles.dart';

class OnBoardingImagesStackView extends StatelessWidget {
  const OnBoardingImagesStackView({
    super.key,
    required this.backgroundImage,
    required this.image,
    required this.visible,
  });

  final String backgroundImage;
  final String image;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    var cubit = OnBoardingCubit.get(context);
    return SizedBox(
      width: double.infinity,
      height: MyResponsive.height(value: 431),
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgWrapper(
              path: backgroundImage,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SvgWrapper(path: image),
          ),
          Visibility(
            visible: visible,
            child: Positioned(
              top: MyResponsive.height(value: 60),
              child: InkWell(
                onTap: () {
                  cubit.onBoardingTap(context);
                },
                child: Padding(
                  padding: MyResponsive.paddingOnly(right: 30),
                  child: Text(
                    AppStrings.skip,
                    style: AppTextStyles.regular13,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
