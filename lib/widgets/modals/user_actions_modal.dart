import 'package:flutter/material.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';

class UserActionsModal extends StatelessWidget {
  const UserActionsModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LogoWidget(
              width: size.width * 0.5,
              height: size.height * 0.2,
              color: 'blue'),
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
              Navigator.pushNamed(context, 'options');
            },
          ),
        ],
      ),
    );
  }
}
