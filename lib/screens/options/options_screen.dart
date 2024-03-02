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
      body: Stack(
        children: [
          Column(
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
                      'Opciones',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.8,
                child: Padding(
                  padding: EdgeInsets.all(size.aspectRatio * 40.0),
                  child: ListView.builder(
                    itemCount: customListTiles.length,
                    itemBuilder: (context, index) {
                      final tile = customListTiles[index];
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.aspectRatio * 5.0),
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
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: FooterWidget(
              size: size,
            ),
          ),
        ],
      ),
    );
  }
}