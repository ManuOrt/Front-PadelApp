import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class BackButtonWidget extends StatelessWidget {
  final double opacity;
  final Color iconColor; // Nuevo parámetro para el color del ícono

  const BackButtonWidget({Key? key, this.opacity = 0.3, this.iconColor = AppColors.primaryWhite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
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