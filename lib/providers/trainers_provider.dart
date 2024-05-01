import 'package:flutter/material.dart';
import 'package:front_end_padelapp/models/models.dart';
import 'package:front_end_padelapp/services/trainer_service.dart';

class TrainersProvider extends ChangeNotifier {
  List<TrainerModel> trainers = [];

  Future<List<TrainerModel>> getTrainers(String token) async {
    trainers = await TrainerServices().getTrainersData(token);
    notifyListeners();
    return trainers;
  }

  Future<TrainerDetailModel> getTrainerDetails(
      TrainerModel trainer, String token) async {
    TrainerDetailModel trainerDetails =
        await TrainerServices().getTrainerOpinions(trainer.id!, token);
    notifyListeners();
    return trainerDetails;
  }
}
