import 'package:flutter/material.dart';
import 'package:front_end_padelapp/models/user_model.dart';
import 'package:front_end_padelapp/services/trainer_service.dart';

class TrainersProvider extends ChangeNotifier {
  List<UserModel> trainers = [];

  Future<List<UserModel>> getTrainers() async {
    trainers = await TrainerServices().getTrainerData();
    notifyListeners();
    return trainers;
  }
}