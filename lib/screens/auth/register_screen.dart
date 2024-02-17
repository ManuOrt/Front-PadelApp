import 'package:flutter/material.dart';
import 'package:front_end_padelapp/providers/providers.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? ontap;
  const RegisterScreen({super.key, this.ontap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final email = TextEditingController();
  final usuario = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
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
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: TextFieldWidget(
                        text: 'Usuario',
                        icon: const Icon(Icons.person),
                        size: size,
                        controller: usuario,
                        validator: (valor) => valor != null && valor.length < 6
                            ? 'Introduce un minimo de 6 caracteres'
                            : null),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: TextFieldWidget(
                        text: 'Correo Electronico',
                        icon: const Icon(Icons.email),
                        size: size,
                        controller: email,
                        validator: (valor) => valor != null && valor.length < 6
                            ? 'Introduce un minimo de 6 caracteres'
                            : null),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: PasswordTextFieldWidget(
                      text: 'Contraseña',
                      size: size,
                      passwordController: passwordController,
                      authProvider: Provider.of<AuthProvider>(context),
                      validator: (valor) => valor != null && valor.length < 6
                          ? 'Introduce un minimo de 6 caracteres'
                          : null,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: PasswordTextFieldWidget(
                      text: 'Repetir Contraseña',
                      size: size,
                      passwordController: repeatPasswordController,
                      authProvider: Provider.of<AuthProvider>(context),
                      validator: (valor) {
                        if (valor != passwordController.text) {
                          return 'Las contraseñas no coinciden';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                    width: size.width * 0.88,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Center(
                        child: Text(
                          'REGISTRARSE',
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
                          "Ya tienes cuenta?",
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        GestureDetector(
                          onTap: widget.ontap,
                          child: const Text(
                            "Iniciar Sesión",
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
