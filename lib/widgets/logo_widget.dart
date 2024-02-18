import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/logo/logo-white.png',
      width: 220,
      height: 200,
    );
  }
}
