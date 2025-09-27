import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/view/login_view.dart';

import '../../../core/cache/cache_data.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_key.dart';
import 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  final PageController pageController = PageController();

  void changePage(int index) {
    currentIndex = index;
    emit(OnBoardingChangePageState());
  }

  void onBoardingTap(BuildContext context) {
    CacheHelper.saveData(key: CacheKeys.firstTime, value: true);
    CacheData.firstTime = true;

    Navigator.pushReplacementNamed(context, LoginView.routeName);
  }
}
