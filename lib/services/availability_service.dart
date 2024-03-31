import 'dart:convert';
import 'package:front_end_padelapp/models/trainer_availability.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AvailabilityService {
  String urlIp = '192.168.1.38';
  String urlLocal = '10.0.2.2';

  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<TrainerAvailability> getTrainerAvailability(int trainerId) async {
    try {
      String startDate = formatter.format(now);
      String endDate =
          formatter.format(DateTime(now.year, now.month + 1, now.day));

      var url = Uri.parse(
          'http://$urlLocal:8080/paddlehub/availability/v1/availabilities?start_date=$startDate&finish_date=$endDate&trainer_id=$trainerId');
      var response = await http.get(url);

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
}