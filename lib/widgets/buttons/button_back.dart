import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: CircleAvatar(
          backgroundColor: AppColors.primaryWhite.withOpacity(0.3),
          radius: 20.0,
          child: const Icon(Icons.arrow_back, color: AppColors.primaryWhite),
        ),
      ),
    );
  }
}
