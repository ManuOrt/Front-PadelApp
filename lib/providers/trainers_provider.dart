import 'package:flutter/material.dart';
import 'package:front_end_padelapp/models/models.dart';
import 'package:front_end_padelapp/services/trainer_service.dart';

class TrainersProvider extends ChangeNotifier {
  List<TrainerModel> trainers = [];
  final TrainerServices _trainerServices = TrainerServices();
  TrainerModel? trainer;

  Future<List<TrainerModel>> getTrainers(String token, String? userId) async {
    trainers = await _trainerServices.getTrainersData(token, userId);
    notifyListeners();
    return trainers;
  }

  Future<TrainerModel> getTrainerById(int trainerId, String token) async {
    TrainerModel trainer =
        await _trainerServices.getTrainerById(trainerId, token);
    notifyListeners();
    return trainer;
  }

  Future<TrainerDetailModel> getTrainerDetails(
      TrainerModel trainer, String token) async {
    TrainerDetailModel trainerDetails =
        await _trainerServices.getTrainerOpinions(trainer.id!, token);
    notifyListeners();
    return trainerDetails;
  }

  Future<void> updateTrainer(TrainerModel trainer, String token) async {
    await _trainerServices.updateTrainer(trainer, token);
    this.trainer = trainer;
    notifyListeners();
  }

  setTrainer(TrainerModel trainer) {
    this.trainer = trainer;
    notifyListeners();
  }
}
