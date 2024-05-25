import 'package:flutter/material.dart';
import 'package:front_end_padelapp/providers/providers.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final UsersProvider usersProvider = Provider.of<UsersProvider>(context);

    final List<CustomListTileWidget> customUserListTiles = [
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
        onTap: () {
          usersProvider.user = null;
          Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
        },
      ),
    ];
    final List<CustomListTileWidget> customTrainerListTiles = [
      CustomListTileWidget(
        title: 'Editar perfil entrenador',
        leadingIcon: const Icon(
          Icons.lock_outline,
          color: AppColors.primary,
        ),
        trealingIcon: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.primary,
        ),
        onTap: () {
          Navigator.pushNamed(context, 'trainer_options');
        },
      ),
      CustomListTileWidget(
        title: 'Disponibilidad',
        leadingIcon: const Icon(
          Icons.lock_outline,
          color: AppColors.primary,
        ),
        trealingIcon: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.primary,
        ),
        onTap: () {},
      )
    ];
    return Scaffold(
      appBar: const HeaderScreen(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.02,
                  left: size.width * 0.04,
                  right: size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(width: size.width * 0.04),
                      Text(
                        'Perfil',
                        style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Usuario',
                    style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary),
                  ),
                  SizedBox(height: size.height * 0.02),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: customUserListTiles.length,
                    itemBuilder: (context, index) {
                      final tile = customUserListTiles[index];
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
                  if (usersProvider.user!.userType == 'M')
                    SizedBox(height: size.height * 0.02),
                  const Text(
                    'Entrenador',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary),
                  ),
                  SizedBox(height: size.height * 0.02),
                  SizedBox(
                    height: size.height * 0.5,
                    child: ListView.builder(
                      itemCount: customTrainerListTiles.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        final tile = customTrainerListTiles[index];
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
          ],
        ),
      ),
      bottomNavigationBar: FooterWidget(
        size: size,
      ),
    );
  }
}
