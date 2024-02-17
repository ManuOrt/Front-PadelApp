import 'package:flutter/material.dart';
import 'package:front_end_padelapp/screens/auth/auth_screens_model.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';

class RecoveryPasswordScreen extends StatelessWidget {
  const RecoveryPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController recoverPasswordController = TextEditingController();

    return AuthScreensModel(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 10.0),
              child: IconButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.primaryWhite.withOpacity(0.3))),
                icon: const Icon(Icons.arrow_back, color: AppColors.primaryWhite),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 const LogoWidget(),
                  Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                    child: TextFieldWidget(
                      icon: const Icon(Icons.email),
                      controller: recoverPasswordController,
                      text: 'Email',
                      validator: (value) => value!.isEmpty ? 'Campo vacío' : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.88,
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
