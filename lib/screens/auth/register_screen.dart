import 'package:flutter/material.dart';
import 'package:front_end_padelapp/providers/providers.dart';
import 'package:front_end_padelapp/screens/auth/auth_screens_model.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final Function()? onTap;

  const RegisterScreen({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final passwordRepeatController = TextEditingController();
    final Size size = MediaQuery.of(context).size;

    return AuthScreensModel(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const LogoWidget(),
                    SizedBox(height: size.height * 0.02),
                    TextFieldWidget(
                      text: 'Usuario',
                      controller: userController,
                      validator: (value) => value!.length < 6
                          ? 'Introduce un mínimo de 6 caracteres'
                          : null,
                      icon: const Icon(Icons.person),
                    ),
                    SizedBox(height: size.height * 0.015),
                    TextFieldWidget(
                      text: 'Correo Electrónico',
                      controller: emailController,
                      validator: (value) => value!.length < 6
                          ? 'Introduce un mínimo de 6 caracteres'
                          : null,
                      icon: const Icon(Icons.email),
                    ),
                    SizedBox(height: size.height * 0.015),
                    PasswordTextFieldWidget(
                      text: 'Contraseña',
                      passwordController: passwordController,
                      size: MediaQuery.of(context).size,
                      authProvider:
                          Provider.of<AuthProvider>(context, listen: true),
                      validator: (valor) => valor != null && valor.length < 6
                          ? 'Contraseña poco segura'
                          : null,
                    ),
                    SizedBox(height: size.height * 0.015),
                    PasswordTextFieldWidget(
                      text: 'Repetir Contraseña',
                      passwordController: passwordRepeatController,
                      size: MediaQuery.of(context).size,
                      authProvider:
                          Provider.of<AuthProvider>(context, listen: false),
                      validator: (valor) {
                        if (valor != passwordRepeatController.text) {
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
                          onTap: onTap,
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
