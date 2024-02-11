import 'package:flutter/material.dart';
import 'package:front_end_padelapp/screens/onboarding/onboarding_screen_model.dart';

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
    OnboardingPageModel(
        title: 'Como usar la Apliación...', 
        videoPath: 'n1Y4HROvFME'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          children: onboardingPagesList
              .map(
                (page) => page.buildPage(
                  context: context,
                  currentIndex: index,
                  onNextPressed: () {
                    if (index < onboardingPagesList.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  onBackPressed: () {
                    if (index > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  onFinalButtonPressed: () {
                    Navigator.pushReplacementNamed(context, '/main');
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
