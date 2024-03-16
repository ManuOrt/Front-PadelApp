import 'package:flutter/material.dart';
import 'package:front_end_padelapp/models/models.dart';
import 'package:front_end_padelapp/providers/trainers_provider.dart';
import 'package:provider/provider.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';

class TrainerDetailScreen extends StatelessWidget {
  final UserModel trainer;

  const TrainerDetailScreen({Key? key, required this.trainer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<TrainerDetailModel>(
        // Cambia a TrainerDetailModel
        future: Provider.of<TrainersProvider>(context, listen: false)
            .getTrainerDetails(trainer),
        builder:
            (BuildContext context, AsyncSnapshot<TrainerDetailModel> snapshot) {
          // Cambia a TrainerDetailModel
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error: No se ha podido cargar el usuario'),
            );
          } else {
            TrainerDetailModel trainerDetails = snapshot.data!;
            UserModel user = trainerDetails.user;
            TrainerModel trainer = trainerDetails.trainer;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      if (user.userImg != null)
                        Image.network(
                          user.userImg!,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      const BackButtonWidget(
                          opacity: 1.0, iconColor: AppColors.primary),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${user.name} ${user.surname}',
                            style: const TextStyle(
                                fontSize: 22,
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                            Text('5 (23 opiniones)',
                                style: TextStyle(
                                    fontSize: 16, color: AppColors.primary)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(color: Colors.grey),
                        const SizedBox(height: 10),
                        const Text(
                          'Descripción',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          trainer.description ??
                              'No description',
                          style: const TextStyle(
                              fontSize: 16, color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
