import 'package:flutter/material.dart';
import 'package:front_end_padelapp/screens/screens.dart';

class ChangeScreen extends StatefulWidget {
  const ChangeScreen({super.key});

  @override
  State<ChangeScreen> createState() => _LoginOrRegiserPageState();
}

class _LoginOrRegiserPageState extends State<ChangeScreen> {
  bool showLoginScreen = true;

  void cambiarPaginas() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(
        ontap: cambiarPaginas,
      );
    } else {
      return RegisterScreen(
        ontap: cambiarPaginas,
      );
    }
  }
}
