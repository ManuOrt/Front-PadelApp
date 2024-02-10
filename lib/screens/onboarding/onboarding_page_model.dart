import 'package:flutter/material.dart';
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
    required BuildContext context,
    required int currentIndex,
    required VoidCallback onNextPressed,
    required VoidCallback onBackPressed,
    required VoidCallback onFinalButtonPressed,
  }) {
    final Size screenSize = MediaQuery.of(context).size;
    final double buttonWidth = screenSize.width * 0.8;
    final double buttonHeight = screenSize.height * 0.07;
    final double topPadding = screenSize.height * 0.3;
    final double titleFontSize = screenSize.width * 0.06;
    final double descriptionFontSize = screenSize.width * 0.04;

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
                  padding: EdgeInsets.only(top: topPadding),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.all(screenSize.width * 0.05),
                  child: description != null && description!.isNotEmpty
                      ? Text(
                          description!,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            height: 1.8,
                            fontSize: descriptionFontSize,
                          ),
                          textAlign: TextAlign.center,
                        )
                      : VideoYoutubePlayerWidget(
                          videoId: videoPath!,
                        ),
                ),
                const SizedBox(height: 40.0),
                BallIndicator(
                    pageCount: pageCount ??= 4, currentIndex: currentIndex),
                const SizedBox(height: 50.0),
                if (currentIndex < pageCount! - 1)
                  OnboardingButton(
                    buttonWidth: buttonWidth,
                    buttonHeight: buttonHeight,
                    buttonText: 'SIGUIENTE',
                    onFinalButtonPressed: onNextPressed,
                  ),
                const SizedBox(height: 10.0),
                if (currentIndex == pageCount! - 1)
                  OnboardingButton(
                    buttonWidth: buttonWidth,
                    buttonHeight: buttonHeight,
                    buttonText: 'IR A LA APLICACIÓN',
                    onFinalButtonPressed: onFinalButtonPressed,
                  ),
                const SizedBox(height: 10.0),
                if (currentIndex > 0)
                  OnboardingButton(
                    buttonWidth: buttonWidth,
                    buttonHeight: buttonHeight,
                    buttonText: 'ATRÁS',
                    onFinalButtonPressed: onBackPressed,
                  ),
              ],
            ),
          ),
        ),
    );
  }
}
