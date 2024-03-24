import 'package:flutter/material.dart';
import 'package:front_end_padelapp/providers/providers.dart';
import 'package:front_end_padelapp/screens/auth/auth_screens_model.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final Function()? onTap;
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();

  RegisterScreen({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return AuthScreensModel(
      child: Stack(
        children: [
          const BackButtonWidget(
              opacity: 0.3, iconColor: AppColors.primaryWhite),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LogoWidget(
                      width: size.width * 0.5,
                      height: size.height * 0.2,
                      color: 'white',
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextFieldWidget(
                      withSize: size.width * 0.87,
                      text: 'Usuario',
                      controller: userController,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      style: const TextStyle(
                        color: AppColors.primaryGray,
                      ),
                      validator: (value) => value!.length < 6
                          ? 'Introduce un mínimo de 6 caracteres'
                          : null,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: AppColors.primaryGray,
                      ),
                    ),
                    SizedBox(height: size.height * 0.015),
                    TextFieldWidget(
                      withSize: size.width * 0.87,
                      text: 'Correo Electrónico',
                      controller: emailController,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      style: const TextStyle(
                        color: AppColors.primaryGray,
                      ),
                      validator: (value) => value!.length < 6
                          ? 'Introduce un mínimo de 6 caracteres'
                          : null,
                      prefixIcon: const Icon(
                        Icons.email,
                        color: AppColors.primaryGray,
                      ),
                    ),
                    SizedBox(height: size.height * 0.015),
                    PasswordTextFieldWidget(
                      text: 'Contraseña',
                      controller: passwordController,
                      withSize: size.width * 0.87,
                      authProvider:
                          Provider.of<AuthProvider>(context, listen: false),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      style: const TextStyle(
                        color: AppColors.primaryGray,
                      ),
                      validator: (valor) => valor != null && valor.length < 6
                          ? 'Contraseña poco segura'
                          : null,
                    ),
                    SizedBox(height: size.height * 0.015),
                    PasswordTextFieldWidget(
                      text: 'Repetir Contraseña',
                      controller: passwordRepeatController,
                      withSize: size.width * 0.87,
                      authProvider: Provider.of<AuthProvider>(context),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      style: const TextStyle(
                        color: AppColors.primaryGray,
                      ),
                      validator: (valor) {
                        if (valor != passwordController.text) {
                          return 'Las contraseñas no coinciden';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: size.height * 0.02),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'REGISTRARSE',
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '¿Ya tienes una cuenta?',
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                          ),
                        ),
                        SizedBox(width: size.width * 0.01),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: const Text(
                            'Iniciar Sesión',
                            style: TextStyle(
                              color: AppColors.primaryWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
