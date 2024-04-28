import 'package:flutter/material.dart';
import 'package:front_end_padelapp/models/models.dart';
import 'package:front_end_padelapp/providers/providers.dart';
import 'package:front_end_padelapp/screens/screens.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    UserModel? user = Provider.of<UsersProvider>(context).user;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.9),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                        child: LogoWidget(
                          width: size.width * 0.2,
                          height: size.height * 0.1,
                          color: 'white',
                        ),
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
                          if (user != null) {
                            Navigator.pushNamed(
                              context,
                              'profile',
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor:
                                      AppColors.primaryWhite.withOpacity(0.9),
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
                                  user.userImg ??
                                      'url_de_tu_imagen_predeterminada',
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
                    ],
                  ),
                ),
                SearcherWidget(size: size),
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
          SizedBox(height: size.height * 0.03),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: FutureBuilder(
              future: Provider.of<TrainersProvider>(context, listen: false)
                  .getTrainers(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<TrainerModel>> snapshot) {
                // Cambia esto para que sea de tipo AsyncSnapshot<List<TrainerModel>>
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Text(
                      'Error: No se han podido cargar los entrenadores disponibles');
                } else {
                  return CarouselWidget(
                    items: snapshot.data!,
                    size: size,
                    onTrainerSelected:
                        (selectedTrainerId, trainerDetails, averageRating) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrainerDetailScreen(
                            trainerId: selectedTrainerId,
                            trainerDetails: trainerDetails,
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: FooterWidget(
        size: size,
      ),
    );
  }
}
