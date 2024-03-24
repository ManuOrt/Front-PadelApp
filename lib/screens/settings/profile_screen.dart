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
        leadingIcon: const Icon(
          Icons.person_outline,
          color: AppColors.primary,
        ),
        trealingIcon: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.primary,
        ),
        onTap: () {
          Navigator.pushNamed(context, 'edit_profile');
        },
      ),
      CustomListTileWidget(
        title: 'Cambiar contraseña',
        leadingIcon: const Icon(
          Icons.lock_outline,
          color: AppColors.primary,
        ),
        trealingIcon: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.primary,
        ),
        onTap: () {},
      ),
      CustomListTileWidget(
        title: 'Notificaciones',
        leadingIcon: const Icon(
          Icons.notifications_active_outlined,
          color: AppColors.primary,
        ),
        trealingIcon: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.primary,
        ),
        onTap: () {},
      ),
      CustomListTileWidget(
        title: 'Opciones',
        leadingIcon: const Icon(
          Icons.settings,
          color: AppColors.primary,
        ),
        trealingIcon: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.primary,
        ),
        onTap: () {
          Navigator.pushNamed(context, 'options');
        },
      ),
      CustomListTileWidget(
        title: 'Cerrar sesión',
        leadingIcon: const Icon(
          Icons.logout,
          color: AppColors.primary,
        ),
        trealingIcon: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.primary,
        ),
        onTap: () {},
      ),
    ];
    return Scaffold(
      appBar: const HeaderScreen(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04, top: size.height * 0.02),
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
              padding: EdgeInsets.all(size.height * 0.02),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: customListTiles.length,
                itemBuilder: (context, index) {
                  final tile = customListTiles[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.015),
                    child: CustomListTileWidget(
                      title: tile.title,
                      switchWidget: tile.switchWidget,
                      onChanged: tile.onChanged,
                      leadingIcon: tile.leadingIcon,
                      trealingIcon: tile.trealingIcon,
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
