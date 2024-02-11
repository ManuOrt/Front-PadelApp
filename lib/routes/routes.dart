import 'package:flutter/material.dart';
import 'package:front_end_padelapp/screens/screens.dart';

var customRoutes = <String, WidgetBuilder>{
  'onboarding': (context) => const OnboardingScreens(),
  'login': (context) => const LoginScreen(),
  'register': (context) => const RegisterScreen(),
  'change': (context) => const ChangeScreen(),
};
