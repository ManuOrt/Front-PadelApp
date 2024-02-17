import 'package:flutter/material.dart';
import 'package:front_end_padelapp/providers/providers.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({Key? key, this.onTap}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordController = TextEditingController();
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Material(
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/img/login.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.60),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/logo/logo-white.png',
                    width: 220,
                    height: 200,
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: TextFieldWidget(
                      icon: const Icon(Icons.email),
                      size: size,
                      controller: _email,
                      text: 'Email',
                      validator: (value) => value!.isEmpty
                          ? 'Campo vacio'
                          : null, //TODO: Add email vaildation with regex or something
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: PasswordTextFieldWidget(
                        text: 'Contraseña',
                        size: size,
                        passwordController: _passwordController,
                        authProvider: Provider.of<AuthProvider>(context),
                        validator: (valor) => valor != null && valor.length < 6
                            ? 'Contraseña poco segura'
                            : null),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 19, top: 5, right: 19),
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        const Text(
                          'Recuerdame',
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, 'recovery_password'),
                          child: const Text(
                            "Olvidaste tu contraseña?",
                            style: TextStyle(
                              color: AppColors.primaryWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                    width: size.width * 0.88,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'home');
                      },
                      child: const Center(
                        child: Text(
                          'INICIAR SESIÓN',
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "No tienes una cuenta aún?",
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            "Registrate",
                            style: TextStyle(
                                color: AppColors.primaryWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
