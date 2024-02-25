import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.07,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: AppColors.primary.withOpacity(0.9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.home,
              color: AppColors.primaryWhite,
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'home');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: AppColors.primaryWhite,
            ),
            onPressed: () {
              //TODO implement favorite screen
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.calendar_month,
              color: AppColors.primaryWhite,
            ),
            onPressed: () {
              //TODO implement calendar screen
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.chat_rounded,
              color: AppColors.primaryWhite,
            ),
            onPressed: () {
              //TODO implement chat screen
            },
          ),
        ],
      ),
    );
  }
}
