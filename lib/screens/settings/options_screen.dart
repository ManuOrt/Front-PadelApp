import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<CustomListTileWidget> customListTiles = [
      CustomListTileWidget(
        title: 'Cambiar a modo oscuro',
        sitchWidget: Switch(
          value: false,
          onChanged: (value) {},
          activeColor: AppColors.primary,
        ),
        onChanged: (value) {},
        onTap: () {},
      ),
      CustomListTileWidget(
        title: 'Idioma',
        icon: const Icon(
          Icons.language,
          color: AppColors.primary,
        ),
        onTap: () {},
      ),
      CustomListTileWidget(
        title: 'Opciones Notificaciones',
        icon: const Icon(
          Icons.notifications_active_outlined,
          color: AppColors.primary,
        ),
        onTap: () {},
      ),
      CustomListTileWidget(
        title: 'Seguridad',
        icon: const Icon(
          Icons.shield_outlined,
          color: AppColors.primary,
        ),
        onTap: () {},
      ),
      CustomListTileWidget(
        title: 'Ver Video Tutorial',
        icon: const Icon(
          Icons.featured_video_outlined,
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
              padding: EdgeInsets.only(left: size.width * 0.04),
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
            Padding(
              padding: EdgeInsets.all(size.height * 0.02),
              child: SingleChildScrollView(
                child: Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: customListTiles.length,
                    itemBuilder: (context, index) {
                      final tile = customListTiles[index];
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height * 0.003),
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
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.04),
              child: const Text(
                'Cerrar Sesión',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(size.height * 0.02),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final tile = customListTiles[index];
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.003),
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
