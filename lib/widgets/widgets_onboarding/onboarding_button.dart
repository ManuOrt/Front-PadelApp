import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class OnboardingButton extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final VoidCallback onFinalButtonPressed;
  final String buttonText; // New parameter for dynamic button text

  const OnboardingButton({
    required this.buttonWidth,
    required this.buttonHeight,
    required this.onFinalButtonPressed,
    required this.buttonText, // Pass the button text here
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onFinalButtonPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(buttonWidth, buttonHeight),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
      child: Text(
        buttonText, // Use the provided button text here
        style: TextStyle(
          color: AppColors.primaryWhite,
          fontSize: 16.0,
        ),
      ),
    );
  }
}

