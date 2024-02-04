import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/ball_indicator.dart';

class OnboardingPageModel {
  final String title;
  final String description;
  String? imagePath;
  int? pageCount;

  OnboardingPageModel({
    required this.title,
    required this.description,
    this.imagePath,
    this.pageCount,
  });

  Widget buildPage({
    required int currentIndex,
    required VoidCallback onNextPressed,
    required VoidCallback onBackPressed,
  }) {
    return Material(
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath ??= 'assets/img/onboarding-img.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              Container(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    height: 1.8,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10.0),
              BallIndicator(
                  pageCount: pageCount ??= 3, currentIndex: currentIndex),
              const SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: onNextPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 120.0,
                    vertical: 12.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
                child: const Text(
                  'SIGUIENTE',
                  style: TextStyle(
                    color: AppColors.primaryWhite,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: onBackPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 135.0,
                    vertical: 12.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
                child: const Text(
                  'ATRÁS',
                  style: TextStyle(
                    color: AppColors.primaryWhite,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
