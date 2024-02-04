import 'package:flutter/material.dart';
import 'package:front_end_padelapp/screens/onboarding/onboarding_page_model.dart';
import 'package:flutter/services.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreens> {
  late Material materialButton;
  late int index = 0;
  final PageController _pageController = PageController();
  final onboardingPagesList = [
    OnboardingPageModel(
      title: '¡Bienvenido a PadelApp!',
      description:
          'En nuestra aplicación, encontrarás el entrenador perfecto para llevar tu juego de pádel al siguiente nivel. Haz clic en "Empezar" y comienza tu viaje hacia un pádel excepcional. ¡Estamos emocionados de acompañarte en esta aventura deportiva!',
    ),
    OnboardingPageModel(
      title: 'Como Usuario...',
      description:
          'En nuestra aplicación, encontrarás el compañero perfecto para llevar tu juego de pádel al siguiente nivel. Haz clic en "Empezar" y comienza tu viaje hacia un pádel excepcional. ¡Estamos emocionados de acompañarte en esta aventura deportiva!',
    ),
    OnboardingPageModel(
      title: 'Como Entrenador...',
      description:
          'En nuestra aplicación, encontrarás el compañero perfecto para llevar tu juego de pádel al siguiente nivel. Haz clic en "Empezar" y comienza tu viaje hacia un pádel excepcional. ¡Estamos emocionados de acompañarte en esta aventura deportiva!',
    ),
  ];  

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.primary,
      ),
    );

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);

    return Stack(
      children: [
        PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: onboardingPagesList
              .map(
                (page) => page.buildPage(
                  currentIndex: index,
                  onNextPressed: () {
                    if (index < onboardingPagesList.length - 1) {
                      setState(() {
                        index++;
                      });
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  onBackPressed: () {
                    if (index > 0) {
                      setState(() {
                        index--;
                      });
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                ),
              )
              .toList(),
          onPageChanged: (int pageIndex) {
            setState(() {
              index = pageIndex;
            });
          },
        ),
      ],
    );
  }
}
