import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';

class RecoveryPasswordScreen extends StatefulWidget {
  @override
  State<RecoveryPasswordScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RecoveryPasswordScreen> {
  final _recoverPassword = TextEditingController();

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
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 50.0, left: 10.0),
                child: IconButton(
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white30)),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/img/logo/logo-white.png',
                        width: 220,
                        height: 200,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: TextFieldWidget(
                      icon: const Icon(Icons.email),
                      size: size,
                      controller: _recoverPassword,
                      text: 'Email',
                      validator: (value) => value!.isEmpty
                          ? 'Campo vacio'
                          : null, //TODO: Add email vaildation with regex or something
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        SizedBox(
                          height: size.height * 0.07,
                          width: size.width * 0.88,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Center(
                              child: Text(
                                "Recuperar Contraseña",
                                style: TextStyle(
                                    color: AppColors.primaryWhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
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
