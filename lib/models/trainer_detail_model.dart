import 'package:front_end_padelapp/models/models.dart';

class TrainerDetailModel {
  final UserModel user;
  final TrainerModel trainer;
  final List<OpinionModel> opinions;

  TrainerDetailModel({
    required this.user,
    required this.trainer,
    required this.opinions,
  });
}