import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class ButtonAvailability extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const ButtonAvailability({super.key, required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.primary, 
        backgroundColor: AppColors.primaryWhite,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
  }