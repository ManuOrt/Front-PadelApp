import 'dart:convert';

import 'package:front_end_padelapp/models/trainer_detail_model.dart';
import 'package:front_end_padelapp/models/trainer_model.dart';
import 'package:front_end_padelapp/models/user_model.dart';
import 'package:http/http.dart' as http;

class TrainerServices {
  Future<List<UserModel>> getTrainerData() async {
    try {
      var url =
          Uri.parse('http://10.0.2.2:8080/paddlehub/user-management/v1/users');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var body = utf8.decode(response.bodyBytes);
        var data = jsonDecode(body) as List;
        List<UserModel> users =
            data.map((user) => UserModel.fromJson(user)).toList();
        List<UserModel> trainers =
            users.where((user) => user.userType?.toUpperCase() == 'T').toList();
        return trainers;
      } else {
        throw Exception('Failed to load trainers');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<TrainerDetailModel> getTrainerDetails(int trainerId) async {
    try {
      var userUrl = Uri.parse(
          'http://10.0.2.2:8080/paddlehub/user-management/v1/users/${trainerId.toString()}');
      var userResponse = await http.get(userUrl);

      if (userResponse.statusCode == 200) {
        var userBody = utf8.decode(userResponse.bodyBytes);
        var userData = jsonDecode(userBody);
        UserModel user = UserModel.fromJson(userData);

        // Actualiza la URL aquí
        var trainerUrl = Uri.parse(
            'http://10.0.2.2:8080/paddlehub/user-management/v1/trainers/${trainerId.toString()}');
        var trainerResponse = await http.get(trainerUrl);

        if (trainerResponse.statusCode == 200) {
          var trainerBody = utf8.decode(trainerResponse.bodyBytes);
          var trainerData = jsonDecode(trainerBody);
          TrainerModel trainer = TrainerModel.fromJson(trainerData);

          return TrainerDetailModel(user: user, trainer: trainer);
        } else {
          throw Exception('Failed to load trainer details');
        }
      } else {
        throw Exception('Failed to load user details');
      }
    } catch (e) {
      rethrow;
    }
  }
}
