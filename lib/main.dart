import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/one_generate_routes.dart';
import 'package:fruits_hub/features/splash/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fruits Hub",
      // home: SplashView(),
      onGenerateRoute: onGenerateRoutes,
      initialRoute: SplashView.routeName,
    );
  }
}
