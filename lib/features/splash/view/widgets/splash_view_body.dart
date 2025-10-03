import 'package:flutter/material.dart';
import 'package:fruits_hub/core/cache/cache_data.dart';
import 'package:fruits_hub/core/cache/cache_helper.dart';
import 'package:fruits_hub/core/cache/cache_key.dart';
import 'package:fruits_hub/core/shared_widgets/svg_wrapper.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/features/auth/view/login_view.dart';
import 'package:fruits_hub/features/on_boarding/view/on_boarding_view.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    onBoardingNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // plant -> slide from left + fade
        WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(
            duration: const Duration(milliseconds: 1000),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: SvgWrapper(path: AppAssets.plant),
          ),
        ),

        // logo -> rotate in
        WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.outgoingScaleDown(
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 500),
          ),
          child: SvgWrapper(path: AppAssets.logo),
        ),

        // footer -> slide up + fade
        WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(
            duration: const Duration(milliseconds: 1000),
            delay: const Duration(milliseconds: 1000),
          ),
          child: SvgWrapper(
            path: AppAssets.splashFooter,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  void onBoardingNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      CacheData.firstTime = CacheHelper.getData(key: CacheKeys.firstTime);
      if (CacheData.firstTime != null) {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
