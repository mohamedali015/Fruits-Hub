import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/on_boarding/manager/on_boarding_cubit.dart';
import 'package:fruits_hub/features/on_boarding/view/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const String routeName = 'onBoarding';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: const Scaffold(
        body: OnBoardingViewBody(),
      ),
    );
  }
}
