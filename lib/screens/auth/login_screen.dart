import 'package:flutter/material.dart';
import 'package:front_end_padelapp/models/models.dart';
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
                      hintText: 'Username',
                      controller: usernameController,
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
                      withSize: size.width * 0.87,
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
                      validator: (valor) => valor != null && valor.length < 1
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
                        onPressed: () async {
                          if (await checkUserData(usernameController.text,
                              passwordController.text, authProvider)) {
                            await buildUserObject(authProvider, usersProvider);
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

  Future<bool> checkUserData(
      String username, String password, AuthProvider authProvider) async {
    TokenDataModel? token = await authProvider.getAuthToken(username, password);
    return token?.accessToken != null;
  }

  buildUserObject(
      AuthProvider authProvider, UsersProvider usersProvider) async {
    final String id = authProvider.decodeToken();
    final UserModel user =
        await usersProvider.getUserById(id, authProvider.getToken()!);
    usersProvider.setCurrentUser(user);
  }
}
