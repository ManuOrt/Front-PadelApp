import 'package:flutter/material.dart';
import 'package:front_end_padelapp/screens/auth/auth_screens_model.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';

class RecoveryPasswordScreen extends StatelessWidget {
  const RecoveryPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController recoverPasswordController =
        TextEditingController();

    return AuthScreensModel(
      child: Stack(
        children: [
          const BackButtonWidget(opacity: 0.3, iconColor: AppColors.primaryWhite),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LogoWidget(
                    width: size.width * 0.5,
                    height: size.height * 0.2,
                    color: 'white',
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: TextFieldWidget(
                      icon: const Icon(Icons.email),
                      controller: recoverPasswordController,
                      text: 'Email',
                      validator: (value) =>
                          value!.isEmpty ? 'Campo vacío' : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: size.width * 0.01),
                        SizedBox(
                          height: size.height * 0.07,
                          width: size.width * 0.88,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Center(
                              child: Text(
                                "Recuperar Contraseña",
                                style: TextStyle(
                                  color: AppColors.primaryWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
