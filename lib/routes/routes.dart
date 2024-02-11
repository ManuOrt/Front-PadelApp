import 'package:flutter/material.dart';
import 'package:front_end_padelapp/screens/onboarding/onboarding_screens.dart';
import 'package:front_end_padelapp/screens/auth/login_screen.dart';

var customRoutes = <String, WidgetBuilder>{
  'onboarding': (context) => const OnboardingScreens(),
  'login': (context) => const LoginScreen(),
};