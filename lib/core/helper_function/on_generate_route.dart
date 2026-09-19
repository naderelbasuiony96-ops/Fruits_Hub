import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/presentation/view/login_view.dart';
import 'package:fruits_hub/features/auth/presentation/view/signup_view.dart';
import 'package:fruits_hub/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:fruits_hub/features/splash_view/presentation/views/splash_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
