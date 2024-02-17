import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class AuthScreensModel extends StatelessWidget {
  final Widget child;

  const AuthScreensModel({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/img/login.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              AppColors.primaryBlack.withOpacity(0.60),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}