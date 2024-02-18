import 'package:flutter/material.dart';
import 'package:front_end_padelapp/providers/providers.dart';
import 'package:front_end_padelapp/screens/auth/auth_screens_model.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final Function()? onTap;
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  LoginScreen({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AuthScreensModel(
      child: Stack(
        children: [
          const BackButtonWidget(),
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
                      text: 'Email',
                      controller: emailController,
                      validator: (value) => value!.isEmpty
                          ? 'Campo vacio'
                          : null, //TODO: Add email vaildation with regex or something
                      icon: const Icon(
                        Icons.email,
                        color: AppColors.primaryGray,
                      ),
                    ),
                    SizedBox(height: size.height * 0.015),
                    PasswordTextFieldWidget(
                      text: 'Contraseña',
                      passwordController: passwordController,
                      size: MediaQuery.of(context).size,
                      authProvider: Provider.of<AuthProvider>(context),
                      validator: (valor) => valor != null && valor.length < 6
                          ? 'Contraseña poco segura'
                          : null,
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      children: [
                        const Text(
                          'Recuérdame',
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, 'recovery_password'),
                          child: const Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(
                              color: AppColors.primaryWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'home');
                        },
                        child: const Text(
                          'INICIAR SESIÓN',
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '¿No tienes una cuenta aún?',
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                          ),
                        ),
                        SizedBox(width: size.width * 0.02),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'register');
                          },
                          child: const Text(
                            'Regístrate',
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
