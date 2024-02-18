import 'package:flutter/material.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            height: size.height * 0.25,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.9),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/img/logo/logo-white.png',
                        width: 100,
                        height: 100,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.notifications,
                          color: AppColors.primaryWhite,
                        ),
                      ),
                      SizedBox(width: size.width * 0.04),
                       GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const Dialog(
                                alignment: Alignment.topCenter,
                                child: UserActionsModal(),
                              );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.person,
                          color: AppColors.primaryWhite,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: size.width * 0.87,
                    height: size.height * 0.07,
                    child: TextField(
                      style: const TextStyle(
                        color: AppColors.primaryBlack,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Buscar',
                        hintStyle: const TextStyle(
                          color: AppColors.primaryBlack,
                        ),
                        prefixIcon: const Icon(Icons.search,
                            color: AppColors.primaryBlack),
                        suffixIcon: const Icon(
                          Icons.filter_list,
                          color: AppColors.primaryBlack,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: AppColors.secondaryWhite,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: const Text(
              'Nuestros entrenadores',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
