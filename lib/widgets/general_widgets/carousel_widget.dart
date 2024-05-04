import 'package:flutter/material.dart';
import 'package:front_end_padelapp/models/models.dart';
import 'package:front_end_padelapp/providers/auth_provider.dart';
import 'package:front_end_padelapp/services/trainer_service.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/utils/get_valoration.dart';
import 'package:provider/provider.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    Key? key,
    required this.items,
    required this.size,
    required this.onTrainerSelected,
  }) : super(key: key);

  final List<TrainerModel> items;
  final Size size;
  final Function(int, TrainerDetailModel, double) onTrainerSelected;

  Future<double> getAverageRating(int trainerId, String token) async {
    TrainerDetailModel trainerDetails =
        await TrainerServices().getTrainerOpinions(trainerId, token);
    return calculateAverageRating(trainerDetails.opinions);
  }

  Future<Map<String, dynamic>> getRatingAndCount(
      int trainerId, String token) async {
    TrainerDetailModel trainerDetails =
        await TrainerServices().getTrainerOpinions(trainerId, token);
    double averageRating = calculateAverageRating(trainerDetails.opinions);
    int count = trainerDetails.opinions.length;
    return {'averageRating': averageRating, 'count': count};
  }

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              int trainerId = items[index].id!;
              TrainerDetailModel trainerDetails =
                  await TrainerServices().getTrainerOpinions(
                trainerId,
                authProvider.getToken()!,
              );
              double averageRating =
                  calculateAverageRating(trainerDetails.opinions);
              onTrainerSelected(trainerId, trainerDetails, averageRating);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.28,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              items[index].user?.userImg ??
                                  'assets/img/default-image.jpg',
                              fit: BoxFit.cover,
                            ),
                            Container(
                              color: const Color(0xFF003153).withOpacity(0.2),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                        color: AppColors.primary.withOpacity(0.8),
                      ),
                      width: double.infinity,
                      height: size.height * 0.12,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Tooltip(
                                message:
                                    '${items[index].user!.name!} ${items[index].user!.surname!}',
                                child: Text(
                                  '${items[index].user!.name!} ${items[index].user!.surname!}',
                                  style: const TextStyle(
                                    color: AppColors.primaryWhite,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: AppColors.primaryWhite,
                                    size: 15,
                                  ),
                                  SizedBox(width: size.width * 0.01),
                                  Expanded(
                                    child: Text(
                                      items[index].user?.address ?? '',
                                      style: const TextStyle(
                                        color: AppColors.primaryWhite,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height * 0.01),
                              FutureBuilder<Map<String, dynamic>>(
                                future: getRatingAndCount(
                                    items[index].id!, authProvider.getToken()!),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    return Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 15,
                                        ),
                                        SizedBox(width: size.width * 0.01),
                                        Text(
                                          '${snapshot.data?['averageRating']?.toStringAsFixed(1) ?? '0.0'} (${snapshot.data?['count'] ?? 0} opiniones)',
                                          style: const TextStyle(
                                            color: AppColors.primaryWhite,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
