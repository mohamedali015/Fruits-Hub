import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/my_responsive.dart';
import 'package:fruits_hub/core/shared_widgets/custom_button.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_constants.dart';
import 'package:fruits_hub/core/utils/app_strings.dart';
import 'package:fruits_hub/features/on_boarding/manager/on_boarding_state.dart';
import 'package:fruits_hub/features/on_boarding/view/widgets/on_boarding_page_view.dart';

import '../../manager/on_boarding_cubit.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = OnBoardingCubit.get(context);
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) => Column(
        children: [
          Expanded(
            child: OnBoardingPageView(),
          ),
          DotsIndicator(
            dotsCount: 2,
            decorator: DotsDecorator(
              activeColor: AppColors.primary,
              color: cubit.currentIndex == 1
                  ? AppColors.primary
                  : AppColors.primary.withValues(alpha: 0.5),
            ),
          ),
          SizedBox(height: MyResponsive.height(value: 29)),
          Visibility(
            visible: cubit.currentIndex == 1,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Padding(
              padding: MyResponsive.paddingSymmetric(
                  horizontal: AppConstants.paddingHorizontal),
              child: CustomButton(
                title: AppStrings.start,
                onPressed: () {
                  cubit.onBoardingTap(context);
                },
              ),
            ),
          ),
          SizedBox(height: MyResponsive.height(value: 43)),
        ],
      ),
    );
  }
}
