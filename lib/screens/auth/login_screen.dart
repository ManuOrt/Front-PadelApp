import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/img/login.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.37),
            BlendMode.srcOver,
          ),
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Inciar Sesión',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Correo Electronico',
                      label: Text('Correo Electronico'),
                      fillColor: Color(0xffFFFFFF),
                      filled: true,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                      label: Text('Contraseña'),
                      suffixIcon: Icon(Icons.visibility_off),
                      fillColor: Color(0xffFFFFFF),
                      filled: true,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 19, top: 8, right: 19),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Recuerdame',
                        style: TextStyle(
                          color: Color(0xffFAFAFA),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Olvidaste tu contraseña?",
                        style: TextStyle(
                          color: Color(0xffFAFAFA),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 350,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                  ),
                  child: const Center(
                    child: Text(
                      'INICIAR SESIÓN',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "No tienes una cuenta aún?",
                        style: TextStyle(
                          color: Color(0xffFAFAFA),
                        ),
                      ),
                      Text(
                        " Registrate",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
