import 'dart:convert';

import 'package:front_end_padelapp/models/models.dart';
import 'package:http/http.dart' as http;

import 'user_service.dart';

class TrainerServices {
  Future<List<TrainerModel>> getTrainersData() async {
    try {
      var url = Uri.parse(
          'http://10.0.2.2:8080/paddlehub/user-management/v1/trainers');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var body = utf8.decode(response.bodyBytes);
        var data = jsonDecode(body) as List;
        List<TrainerModel> trainers =
            data.map((trainer) => TrainerModel.fromJson(trainer)).toList();
        return trainers;
      } else {
        throw Exception('Failed to load trainers');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<TrainerModel> getTrainerById(int trainerId) async {
    try {
      var url = Uri.parse(
          'http://10.0.2.2:8080/paddlehub/user-management/v1/trainers/$trainerId');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var body = utf8.decode(response.bodyBytes);
        var data = jsonDecode(body);
        TrainerModel trainer = TrainerModel.fromJson(data);
        return trainer;
      } else {
        throw Exception('Failed to load trainer');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<TrainerDetailModel> getTrainerOpinions(int trainerId) async {
    try {
      TrainerModel trainer = await getTrainerById(trainerId);
      UserServices userServices = UserServices();

      var opinionsUrl = Uri.parse(
          'http://10.0.2.2:8080/paddlehub/trainer-opinion/v1/trainers/$trainerId/opinions');
      var opinionsResponse = await http.get(opinionsUrl);
      if (opinionsResponse.statusCode == 200) {
        var opinionsBody = utf8.decode(opinionsResponse.bodyBytes);
        var opinionsData = jsonDecode(opinionsBody) as List;
        List<OpinionModel> opinions = [];
        for (var opinionData in opinionsData) {
          OpinionModel opinion = OpinionModel.fromJson(opinionData);
          UserModel user = await userServices.getUserById(opinion.userId!);
          opinion.userName = user.name;
          opinion.userImg = user.userImg;
          opinion.surname = user.surname;
          opinions.add(opinion);
        }

        return TrainerDetailModel(
          user: trainer.user!,
          trainer: trainer,
          opinions: opinions,
        );
      } else {
        throw Exception('Failed to load trainer opinions');
      }
    } catch (e) {
      rethrow;
    }
  }
}
