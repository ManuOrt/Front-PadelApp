import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class BallIndicator extends StatelessWidget {
  final int pageCount;
  final int currentIndex;

  const BallIndicator({
    Key? key,
    required this.pageCount,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) => Container(
          width: 20.0,
          height: 20.0,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: currentIndex == index ? AppColors.activeBall : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcATop,
            ),
            child: Image.asset(
              'assets/img/padel_ball.png',
            ),
          ),
        ),
      ),
    );
  }
}
