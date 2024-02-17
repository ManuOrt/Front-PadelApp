import 'package:flutter/material.dart';
import 'package:front_end_padelapp/providers/providers.dart';
import 'package:front_end_padelapp/screens/auth/auth_screens_model.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final Function()? ontap;

  const RegisterScreen({Key? key, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();

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
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      text: 'Usuario',
                      controller: TextEditingController(),
                      validator: (value) => value!.length < 6
                          ? 'Introduce un mínimo de 6 caracteres'
                          : null,
                      icon: const Icon(Icons.person),
                    ),
                    const SizedBox(height: 10),
                    TextFieldWidget(
                      text: 'Correo Electrónico',
                      controller: TextEditingController(),
                      validator: (value) => value!.length < 6
                          ? 'Introduce un mínimo de 6 caracteres'
                          : null,
                      icon: Icon(Icons.email),
                    ),
                    SizedBox(height: 10),
                    PasswordTextFieldWidget(
                      text: 'Contraseña',
                      passwordController: passwordController,
                      size: MediaQuery.of(context).size,
                      authProvider: Provider.of<AuthProvider>(context),
                      validator: (valor) =>
                          valor != null && valor.length < 6
                              ? 'Contraseña poco segura'
                              : null,
                    ),
                    SizedBox(height: 10),
                    PasswordTextFieldWidget(
                      text: 'Repetir Contraseña',
                      passwordController: TextEditingController(),
                      size: MediaQuery.of(context).size,
                      authProvider: Provider.of<AuthProvider>(context),
                      validator: (valor) {
                        if (valor != passwordController.text) {
                          return 'Las contraseñas no coinciden';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'REGISTRARSE',
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '¿Ya tienes una cuenta?',
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                          ),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: ontap,
                          child: Text(
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
