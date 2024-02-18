import 'package:flutter/material.dart';
import 'package:front_end_padelapp/screens/auth/recovery_password_screen.dart';
import 'package:front_end_padelapp/screens/screens.dart';

var customRoutes = <String, WidgetBuilder>{
  'onboarding': (context) => const OnboardingScreens(),
  'login': (context) => LoginScreen(),
  'register': (context) => RegisterScreen(),
  'recovery_password': (context) => const RecoveryPasswordScreen(),
  'change': (context) => const ChangeScreen(),
  'home': (context) => const HomeScreen(),
};
