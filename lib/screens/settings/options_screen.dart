import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<CustomListTileWidget> customListTilesOptions = [
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
    final List<CustomListTileWidget> customListTilesPreferences = [
      CustomListTileWidget(
        title: 'Políticas y Privacidad',
        icon: const Icon(
          Icons.privacy_tip_outlined,
          color: AppColors.primary,
        ),
        onTap: () {},
      ),
      CustomListTileWidget(
        title: 'Ayuda y Soporte',
        icon: const Icon(
          Icons.help_outline,
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
                    itemCount: customListTilesOptions.length,
                    itemBuilder: (context, index) {
                      final tile = customListTilesOptions[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.015),
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
                'Preferencias',
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
                  itemCount: customListTilesPreferences.length,
                  itemBuilder: (context, index) {
                    final tile = customListTilesPreferences[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.015),
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
