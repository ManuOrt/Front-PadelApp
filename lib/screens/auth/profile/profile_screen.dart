import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<CustomListTileWidget> customListTiles = [
      CustomListTileWidget(
        title: 'Editar perfil',
        icon: const Icon(
          Icons.person_outline,
          color: AppColors.primary,
        ),
        onChanged: (value) {},
        onTap: () {},
      ),
      CustomListTileWidget(
        title: 'Cambiar contraseña',
        icon: const Icon(
          Icons.lock_outline,
          color: AppColors.primary,
        ),
        onTap: () {},
      ),
      CustomListTileWidget(
        title: 'Notificaciones',
        icon: const Icon(
          Icons.notifications_active_outlined,
          color: AppColors.primary,
        ),
        onTap: () {},
      ),
      CustomListTileWidget(
        title: 'Opciones',
        icon: const Icon(
          Icons.settings,
          color: AppColors.primary,
        ),
        onTap: () {
          Navigator.pushNamed(context, 'options');
        },
      ),
      CustomListTileWidget(
        title: 'Cerrar sesión',
        icon: const Icon(
          Icons.logout,
          color: AppColors.primary,
        ),
        onTap: () {},
      ),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(child: HeaderScreen()),
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
                    'Perfil',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary),
                  ),
                ],
              ),
            ),
            Padding(
              //TODO: Tamaño entre opciones y CustomListTileWidget diferente, en diferentes dispositivos
              padding: EdgeInsets.all(size.height * 0.02),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: customListTiles.length,
                itemBuilder: (context, index) {
                  final tile = customListTiles[index];
                  return Padding(
                    padding:
                        EdgeInsets.only(bottom: size.height * 0.015),
                    child: CustomListTileWidget(
                      title: tile.title,
                      sitchWidget: tile.sitchWidget,
                      onChanged: tile.onChanged,
                      icon: tile.icon,
                      onTap: tile.onTap,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterWidget(
        size: size,
      ),
    );
  }
}
