import 'dart:math';
import 'package:flutter/material.dart';
import 'package:front_end_padelapp/models/models.dart';
import 'package:front_end_padelapp/services/availability_service.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:front_end_padelapp/widgets/widgets.dart';

class PriceFooterWidget extends StatelessWidget {
  final int trainerId;
  final VoidCallback onButtonPressed;

  const PriceFooterWidget({super.key, required this.trainerId, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    final AvailabilityService trainerServices = AvailabilityService();
    return FutureBuilder<TrainerAvailability>(
      future: trainerServices.getTrainerAvailability(trainerId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          AvailabilityModel availability = snapshot.data!.availabilities![0];
          double highestPrice = max(
            availability.morningPrice ?? 0,
            availability.eveningPrice ?? 0,
          );
          return BottomAppBar(
            color: AppColors.primary.withOpacity(0.9),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${highestPrice.toStringAsFixed(2)}€/h',
                    style: const TextStyle(
                      color: AppColors.primaryWhite,
                      fontSize: 20,
                    ),
                  ),
                  ButtonAvailability(
                    onPressed: onButtonPressed,
                    buttonText: 'Ver Disponibilidad',
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}