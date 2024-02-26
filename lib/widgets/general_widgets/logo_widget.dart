import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.color});

  final String color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/logo/logo-$color.png',
      width: width,
      height: height,
    );
  }
}
