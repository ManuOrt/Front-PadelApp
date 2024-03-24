import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

import '../../screens/screens.dart';

class BackButtonWidget extends StatelessWidget {
  final double opacity;
  final Color iconColor;
  final bool goToHome;

  const BackButtonWidget({Key? key, this.opacity = 0.3, this.iconColor = AppColors.primaryWhite, this.goToHome = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 10.0),
      child: GestureDetector(
       onTap: () {
          if (goToHome) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (Route<dynamic> route) => false,
            );
          } else {
            Navigator.pop(context);
          }
        },
        child: CircleAvatar(
          backgroundColor: AppColors.primaryWhite.withOpacity(opacity),
          radius: 20.0,
          child: Icon(Icons.arrow_back, color: iconColor),
        ),
      ),
    );
  }
}