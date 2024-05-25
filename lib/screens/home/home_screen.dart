import 'package:flutter/material.dart';
import 'package:front_end_padelapp/models/models.dart';
import 'package:front_end_padelapp/providers/providers.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const HeaderScreen(),
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.1,
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: SearcherWidget(size: size),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  SizedBox(height: size.height * 0.02),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: FutureBuilder(
                      future: Provider.of<TrainersProvider>(context,
                              listen: false)
                          .getTrainers(
                              Provider.of<AuthProvider>(context, listen: false)
                                  .getToken()!,
                              null),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<TrainerModel>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                            onTrainerSelected: (selectedTrainerId,
                                trainerDetails, averageRating) {
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
