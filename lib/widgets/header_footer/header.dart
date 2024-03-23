import 'package:flutter/material.dart';
import 'package:front_end_padelapp/models/user_model.dart';
import 'package:front_end_padelapp/screens/screens.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

class HeaderScreen extends StatelessWidget implements PreferredSizeWidget {
  const HeaderScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    UserModel? user = Provider.of<UsersProvider>(context).user;

    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: Image.asset(
            'assets/img/logo/logo-white.png',
            width: 85,
            height: 85,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.notifications,
              color: AppColors.primaryWhite,
            ),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, right: 20.0),
          child: GestureDetector(
            onTap: () {
              if (user != null) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              } else {
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
              }
            },
            child: user != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      user.userImg ?? const Icon(Icons.person).toString(),
                      width: size.width * 0.08,
                      height: size.height * 0.05,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Icon(
                    Icons.person,
                    color: AppColors.primaryWhite,
                  ),
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
