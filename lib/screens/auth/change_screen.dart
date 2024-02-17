import 'package:flutter/material.dart';
import 'package:front_end_padelapp/screens/screens.dart';

class ChangeScreen extends StatefulWidget {
  const ChangeScreen({super.key});

  @override
  State<ChangeScreen> createState() => _LoginOrRegiserPageState();
}

class _LoginOrRegiserPageState extends State<ChangeScreen> {
  bool showLoginScreen = true;

  void changeScreen() {
    setState(
      () {
        showLoginScreen = !showLoginScreen;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(
        onTap: changeScreen,
      );
    } else {
      return RegisterScreen(
        onTap: changeScreen,
      );
    }
  }
}
