import 'package:front_end_padelapp/models/trainer_model.dart';
import 'package:front_end_padelapp/models/user_model.dart';

class TrainerDetailModel {
  final UserModel user;
  final TrainerModel trainer;

  TrainerDetailModel({
    required this.user,
    required this.trainer,
  });
}