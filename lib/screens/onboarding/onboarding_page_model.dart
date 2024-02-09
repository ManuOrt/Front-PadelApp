import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

import '../../widgets/widgets.dart';

class OnboardingPageModel {
  final String title;
  String? description;
  String? imagePath;
  String? videoPath;
  int? pageCount;

  OnboardingPageModel({
    required this.title,
    this.description,
    this.imagePath,
    this.videoPath,
    this.pageCount,
  });

  Widget buildPage({
    required int currentIndex,
    required VoidCallback onNextPressed,
    required VoidCallback onBackPressed,
    required VoidCallback onFinalButtonPressed,
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
          child: SingleChildScrollView(
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
                  child: description != null && description!.isNotEmpty
                      ? Text(
                          description!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            height: 1.8,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center,
                        )
                      : VideoYoutubePlayerWidget(
                          videoId: videoPath!,
                        ),
                ),
                const SizedBox(height: 10.0),
                BallIndicator(
                    pageCount: pageCount ??= 4, currentIndex: currentIndex),
                const SizedBox(height: 50.0),
                if (currentIndex < pageCount! - 1)
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
                if (currentIndex == pageCount! - 1)
                  ElevatedButton(
                    onPressed: onFinalButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 85.0,
                        vertical: 12.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                    child: const Text(
                      'IR A LA APLICACIÓN',
                      style: TextStyle(
                        color: AppColors.primaryWhite,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                const SizedBox(height: 10.0),
                if (currentIndex > 0)
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
      ),
    );
  }
}
