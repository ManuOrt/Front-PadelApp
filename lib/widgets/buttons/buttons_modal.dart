import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class ButtonsModal extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ButtonsModal({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400, // Set the fixed width of the button
      height: 50, // Set the fixed height of the button
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: AppColors.primary),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
