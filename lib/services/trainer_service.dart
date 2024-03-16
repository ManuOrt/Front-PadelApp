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
        var data = jsonDecode(response.body) as List;
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
    var url = Uri.parse(
        'http://10.0.2.2:8080/paddlehub/user-management/v1/users/${trainerId.toString()}');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data);
      TrainerModel trainer = TrainerModel.fromJson(data);
      return TrainerDetailModel(user: user, trainer: trainer);
    } else {
      throw Exception('Failed to load trainer details');
    }
  } catch (e) {
    rethrow;
  }
}
}
