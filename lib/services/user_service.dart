import 'dart:convert';

import 'package:front_end_padelapp/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserServices {
  Future<List<UserModel>> getUserData() async {
    try {
      var url = Uri.parse(
          'http://10.0.2.2:8080/padel-coach/user-management/v1/users');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        List<UserModel> users =
            data.map((user) => UserModel.fromJson(user)).toList();
        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      rethrow;
    }
  }
}
