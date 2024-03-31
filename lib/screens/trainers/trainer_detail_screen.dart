import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:front_end_padelapp/models/models.dart';
import 'package:front_end_padelapp/providers/trainers_provider.dart';
import 'package:front_end_padelapp/screens/home/home_screen.dart';
import 'package:front_end_padelapp/services/location_service.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../utils/get_valoration.dart';

class TrainerDetailScreen extends StatelessWidget {
  final int trainerId;
  final TrainerDetailModel trainerDetails;
  final LocationService locationService = LocationService();

  TrainerDetailScreen({
    super.key,
    required this.trainerId,
    required this.trainerDetails,
  });

  @override
  Widget build(BuildContext context) {
    UserModel user = trainerDetails.user;
    TrainerModel trainer = trainerDetails.trainer;
    List<OpinionModel> opinions = trainerDetails.opinions;
    final Size size = MediaQuery.of(context).size;
    double averageRating = calculateAverageRating(opinions);
    return Scaffold(
      body: SingleChildScrollView(
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
                    opacity: 1.0, iconColor: AppColors.primary, goToHome: true),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${user.name} ${user.surname}',
                      style: const TextStyle(
                          fontSize: 22,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: size.height * 0.01),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 20),
                      Text(
                          '${averageRating.toStringAsFixed(1)} (${opinions.length} opiniones)',
                          style: const TextStyle(
                              fontSize: 16, color: AppColors.primary)),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  const Divider(color: Colors.grey),
                  SizedBox(height: size.height * 0.01),
                  const Text(
                    'Descripción',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    trainer.description ?? 'No description',
                    style:
                        const TextStyle(fontSize: 16, color: AppColors.primary),
                  ),
                  SizedBox(height: size.height * 0.02),
                  const Text(
                    "Categorías",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.01),
                  trainer.categories != null
                      ? Wrap(
                          spacing: 20.0,
                          children: [
                            for (int i = 0; i < trainer.categories!.length; i++)
                              Chip(
                                label: Text(
                                  trainer.categories![i].toString(),
                                  style: const TextStyle(
                                      fontSize: 16, color: AppColors.primary),
                                ),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(
                                      color: AppColors.primary),
                                ),
                              ),
                          ],
                        )
                      : const Text('No categories'),
                  SizedBox(height: size.height * 0.02),
                  const Text("Localización",
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: size.height * 0.01),
                  FutureBuilder<LatLng>(
                    future: locationService.getLatLng(trainer.location),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        LatLng latLng = snapshot.data!;
                        return SizedBox(
                          height: size.height * 0.3,
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: latLng,
                              zoom: 14.4746,
                            ),
                            markers: {
                              Marker(
                                markerId: const MarkerId('1'),
                                position: latLng,
                                infoWindow: InfoWindow(title: trainer.location),
                              ),
                            },
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  const Text("Opiniones",
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: size.height * 0.02),
                  Column(
                    children: [
                      for (int i = 0; i < opinions.length; i++) ...[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: i % 2 == 0
                                  ? AppColors.primary.withOpacity(0.8)
                                  : const Color(0xFFE6E6E6),
                              borderRadius: BorderRadius.circular(5),
                              border: i % 2 != 0
                                  ? Border.all(
                                      color: AppColors.primary,
                                      width: 1,
                                    )
                                  : null,
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              title: Row(
                                children: [
                                  opinions[i].userImg != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          child: Image.network(
                                            opinions[i].userImg!,
                                            fit: BoxFit.cover,
                                            width: size.width * 0.12,
                                            height: size.height * 0.07,
                                          ),
                                        )
                                      : const Icon(
                                          Icons.person,
                                          color: AppColors.primary,
                                          size: 50,
                                        ),
                                  SizedBox(width: size.width * 0.02),
                                  Text(
                                    '${opinions[i].userName} ${opinions[i].surname ?? ''}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: i % 2 == 0
                                          ? Colors.white
                                          : AppColors.primary,
                                    ),
                                  ),
                                  SizedBox(width: size.width * 0.02),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: size.width * 0.01),
                                  Text(
                                    opinions[i].comment ?? '',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: i % 2 == 0
                                          ? Colors.white
                                          : AppColors.primary,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        DateFormat('MMM dd, yyyy').format(
                                            opinions[i].date ?? DateTime.now()),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: i % 2 == 0
                                              ? Colors.white
                                              : AppColors.primary,
                                        ),
                                      ),
                                      const Spacer(),
                                      RatingBarIndicator(
                                        rating: opinions[i].rating!.toDouble(),
                                        itemCount: 5,
                                        itemSize: 15.0,
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                      ),
                                      SizedBox(width: size.width * 0.01),
                                      Text(
                                        opinions[i].rating!.toStringAsFixed(1),
                                        style: TextStyle(
                                          color: i % 2 == 0
                                              ? Colors.white
                                              : AppColors.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.015)
                      ],
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Entrenadores Similares',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  FutureBuilder(
                    future:
                        Provider.of<TrainersProvider>(context, listen: false)
                            .getTrainers(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<TrainerModel>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return const Text(
                            'Error: No se han podido cargar los entrenadores disponibles');
                      } else {
                        List<TrainerModel> otherTrainers = snapshot.data!
                            .where((trainer) => trainer.id != trainerId)
                            .toList();

                        return CarouselWidget(
                          items: otherTrainers,
                          size: MediaQuery.of(context).size,
                          onTrainerSelected: (selectedTrainerId, trainerDetails,
                              averageRating) {
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
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PriceFooterWidget(
        trainerId: trainerId,
        onButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
