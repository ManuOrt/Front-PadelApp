import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            height: size.height * 0.07,
            color: AppColors.primary,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                LogoWidget(
                  width: size.width * 0.2,
                  height: size.height * 0.1,
                  color: 'blue',
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.notifications,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(width: size.width * 0.04),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.person,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, 'home');
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(width: size.width * 0.04),
                const Text(
                  'Opciones',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  ListTile(
                    title: const Text(
                      'Cambiar a modo oscuro',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Switch(
                      value: true,
                      onChanged: (bool value) {
                        // TODO: Añadir funcionalidad para agregar modo oscuro
                      },
                      activeColor: AppColors.primary,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'profile');
                    },
                    tileColor: Colors.grey[200],
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: const BorderSide(
                          color: AppColors.primary, width: 2.0),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
