import 'package:flutter/material.dart';
import 'package:uts/src/screens/onboarding_screen.dart';
import 'package:uts/src/screens/sign_in_screen.dart';

class AppRouter {
  static const String initialRoute = OnboardingScreen.routeName;

  static Map<String, WidgetBuilder> get routes => {
        OnboardingScreen.routeName: (_) => const OnboardingScreen(),
        SignInScreen.routeName: (_) => const SignInScreen(),
      };
}


