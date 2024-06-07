import 'dart:convert';

import 'package:front_end_padelapp/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'user_service.dart';

class TrainerServices {
  UserServices userServices = UserServices();
  String urlIp = '192.168.1.38';
  String urlLocal = '10.0.2.2';

  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<List<TrainerModel>> getTrainersData(
    String token,
    String? userId,
  ) async {
    try {
      var url = Uri.parse(
        'http://$urlLocal:8080/paddlehub/user-management/v1/trainers${userId != null ? '?user_id=$userId' : ''}',
      );
      var response = await http.get(url,
          headers: <String, String>{'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        var body = utf8.decode(response.bodyBytes);
        var data = jsonDecode(body) as List;
        List<TrainerModel> trainers =
            data.map((trainer) => TrainerModel.fromJson(trainer)).toList();

        for (var trainer in trainers) {
          UserModel user =
              await userServices.getUserById(trainer.userId!.toString(), token);
          trainer.user = user;
        }

        return trainers;
      } else {
        throw Exception('Failed to load trainers');
      }
    } catch (e) {
      throw Exception;
    }
  }

  Future<TrainerModel> getTrainerById(int trainerId, String token) async {
    try {
      var url = Uri.parse(
          'http://$urlLocal:8080/paddlehub/user-management/v1/trainers/$trainerId');
      var response = await http.get(url,
          headers: <String, String>{'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        var body = utf8.decode(response.bodyBytes);
        var data = jsonDecode(body);
        TrainerModel trainer = TrainerModel.fromJson(data);
        UserModel user =
            await userServices.getUserById(trainer.userId!.toString(), token);
        trainer.user = user;
        return trainer;
      } else {
        throw Exception('Failed to load trainer');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<TrainerDetailModel> getTrainerOpinions(
      int trainerId, String token) async {
    try {
      TrainerModel trainer = await getTrainerById(trainerId, token);

      var opinionsUrl = Uri.parse(
        'http://$urlLocal:8080/paddlehub/trainer-opinion/v1/trainers/$trainerId/opinions',
      );
      var opinionsResponse = await http.get(opinionsUrl,
          headers: <String, String>{'Authorization': 'Bearer $token'});
      if (opinionsResponse.statusCode == 200) {
        var opinionsBody = utf8.decode(opinionsResponse.bodyBytes);
        var opinionsData = jsonDecode(opinionsBody) as List;
        List<OpinionModel> opinions = [];
        for (var opinionData in opinionsData) {
          OpinionModel opinion = OpinionModel.fromJson(opinionData);
          UserModel user =
              await userServices.getUserById(opinion.userId!.toString(), token);
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

  Future<TrainerAvailability> getTrainerAvailability(
      int trainerId, String token) async {
    try {
      String startDate = formatter.format(now);
      String endDate =
          formatter.format(DateTime(now.year, now.month + 1, now.day));

      var url = Uri.parse(
          'http://$urlLocal:8080/paddlehub/availability/v1/availabilities?start_date=$startDate&finish_date=$endDate&trainer_id=$trainerId');
      var response = await http.get(url,
          headers: <String, String>{'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        var body = utf8.decode(response.bodyBytes);
        var data = jsonDecode(body);
        TrainerAvailability trainerAvailability =
            TrainerAvailability.fromJson(data);
        return trainerAvailability;
      } else {
        throw Exception('Failed to load trainer availability');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateTrainer(TrainerModel trainer, String token) async {
    try {
      var url = Uri.parse(
          'http://$urlLocal:8080/paddlehub/user-management/v1/trainers/${trainer.id}');
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(trainer.toJson()));

      if (response.statusCode == 200) {
        return;
      }
    } catch (e) {
      throw Exception('Failed to update trainer $e');
    }
  }
}
