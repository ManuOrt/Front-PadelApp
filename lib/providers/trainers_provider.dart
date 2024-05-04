import 'package:flutter/material.dart';
import 'package:front_end_padelapp/models/models.dart';
import 'package:front_end_padelapp/services/trainer_service.dart';

class TrainersProvider extends ChangeNotifier {
  List<TrainerModel> trainers = [];
  final TrainerServices _trainerServices = TrainerServices();

  Future<List<TrainerModel>> getTrainers(String token) async {
    trainers = await _trainerServices.getTrainersData(token);
    notifyListeners();
    return trainers;
  }

  Future<TrainerDetailModel> getTrainerDetails(
      TrainerModel trainer, String token) async {
    TrainerDetailModel trainerDetails =
        await _trainerServices.getTrainerOpinions(trainer.id!, token);
    notifyListeners();
    return trainerDetails;
  }
}
