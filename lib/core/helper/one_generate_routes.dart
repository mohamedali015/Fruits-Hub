import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/view/login_view.dart';
import 'package:fruits_hub/features/splash/view/splash_view.dart';

import '../../features/auth/view/register_view.dart';
import '../../features/on_boarding/view/on_boarding_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnBoardingView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());

    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());

    default:
      return MaterialPageRoute(builder: (context) => SplashView());
  }
}
