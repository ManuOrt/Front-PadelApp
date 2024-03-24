import 'package:flutter/material.dart';
import 'package:front_end_padelapp/models/models.dart';
import 'package:front_end_padelapp/services/trainer_service.dart';

class TrainersProvider extends ChangeNotifier {
  List<TrainerModel> trainers = []; // Cambia esto para que sea de tipo List<TrainerModel>

  Future<List<TrainerModel>> getTrainers() async {
    trainers = await TrainerServices().getTrainersData();
    notifyListeners();
    return trainers;
  }

  Future<TrainerDetailModel> getTrainerDetails(TrainerModel trainer) async {
    TrainerDetailModel trainerDetails =
        await TrainerServices().getTrainerOpinions(trainer.id!);
    notifyListeners();
    return trainerDetails;
  }
}