import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';

class HeaderScreen extends StatelessWidget implements PreferredSizeWidget {
  const HeaderScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Image.asset(
          'assets/img/logo/logo-white.png',
          width: 85,
          height: 85,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: IconButton(
            icon: const Icon(
              Icons.notifications,
              color: AppColors.primaryWhite,
            ),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: IconButton(
            icon: const Icon(
              Icons.person,
              color: AppColors.primaryWhite,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: AppColors.primaryWhite.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: size.width * 0.8,
                      height: size.height * 0.5,
                      child: const UserActionsModal(),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
      backgroundColor: AppColors.primary,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}

