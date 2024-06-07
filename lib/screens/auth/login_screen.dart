import 'package:flutter/material.dart';
import 'package:front_end_padelapp/providers/providers.dart';
import 'package:front_end_padelapp/screens/auth/auth_screens_model.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final Function()? onTap;
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  LoginScreen({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    final UsersProvider usersProvider = Provider.of<UsersProvider>(context);
    final TrainersProvider trainersProvider =
        Provider.of<TrainersProvider>(context);
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
                    LogoWidget(
                      width: size.width * 0.5,
                      height: size.height * 0.2,
                      color: 'white',
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextFieldWidget(
                      hintText: 'Username',
                      controller: usernameController,
                      keyboardType: TextInputType.text,
                      withSize: size.width * 0.87,
                      validator: (value) => value!.isEmpty
                          ? 'Campo vacio'
                          : null, //TODO: Add email vaildation with regex or something
                      prefixIcon: const Icon(
                        Icons.email,
                        color: AppColors.primaryGray,
                      ),
                      hintStyle: const TextStyle(
                        color: AppColors.primaryGray,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    SizedBox(height: size.height * 0.015),
                    PasswordTextFieldWidget(
                      hintText: 'Contraseña',
                      controller: passwordController,
                      withSize: size.width * 0.87,
                      authProvider: Provider.of<AuthProvider>(context),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintStyle: const TextStyle(
                        color: AppColors.primaryGray,
                      ),
                      validator: (valor) => valor != null && valor.isEmpty
                          ? 'Contraseña poco segura'
                          : null, //TODO Add correct verification instead this one.
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
                      height: size.height * 0.06,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          bool success = await authProvider.login(
                            usernameController.text,
                            passwordController.text,
                            usersProvider,
                            trainersProvider,
                          );
                          if (success) {
                            Navigator.pushNamed(context, 'home');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Usuario o contraseña incorrectos'),
                              ),
                            );
                          }
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
