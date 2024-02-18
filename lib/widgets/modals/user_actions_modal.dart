import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/buttons/buttons_modal.dart';

class UserActionsModal extends StatelessWidget {
  const UserActionsModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.5,
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/img/logo/logo-blue.png',
            width: 200,
            height: 150,
          ),
          SizedBox(height: size.height * 0.01),
          ButtonsModal(
            label: 'INICIAR SESIÓN',
            onPressed: () {
              Navigator.pushNamed(context, 'login');
            },
          ),
          SizedBox(height: size.height * 0.02),
          ButtonsModal(
            label: 'REGISTRARSE',
            onPressed: () {
              Navigator.pushNamed(context, 'register');
            },
          ),
          SizedBox(height: size.height * 0.02),
          ButtonsModal(
            label: 'OPCIONES',
            onPressed: () {
              //TODO: Add options
            },
          ),
        ],
      ),
    );
  }
}
