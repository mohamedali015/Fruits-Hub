import 'package:flutter/material.dart';
import 'package:fruits_hub/core/shared_widgets/svg_wrapper.dart';
import 'package:fruits_hub/core/utils/app_assets.dart';
import 'package:fruits_hub/features/on_boarding/view/on_boarding_view.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgWrapper(path: AppAssets.plant),
          ],
        ),
        SvgWrapper(path: AppAssets.logo),
        SvgWrapper(
          path: AppAssets.splashFooter,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void onBoardingNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    });
  }
}
