import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/core/helper/one_generate_routes.dart';
import 'package:fruits_hub/core/network/firebase_helper.dart';
import 'package:fruits_hub/core/utils/app_theme.dart';
import 'package:fruits_hub/features/auth/view/login_view.dart';
import 'package:fruits_hub/features/auth/view/login_view.dart';
import 'package:fruits_hub/features/on_boarding/view/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/view/splash_view.dart';
import 'package:fruits_hub/generated/l10n.dart';

import 'core/cache/cache_helper.dart';
import 'core/helper/custom_bloc_observer.dart';
import 'core/helper/get_it.dart';
import 'features/auth/view/register_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();
  await CacheHelper.init();
  await FirebaseHelper.firebaseInit();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          // localization
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale("ar"),

          // theme
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          title: "Fruits Hub",

          // routes
          onGenerateRoute: onGenerateRoutes,
          initialRoute: LoginView.routeName,
          home: child,
        );
      },
      child: const LoginView(),
    );
  }
}
