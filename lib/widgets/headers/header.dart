import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Row(
          children: [
            Image.asset(
              'assets/img/logo/logo-blue.png',
              width: 100,
              height: 100,
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
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      backgroundColor: AppColors.primaryWhite.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.topCenter,
                      child: const UserActionsModal(),
                    );
                  },
                );
              },
              child: const Icon(
                Icons.person,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
