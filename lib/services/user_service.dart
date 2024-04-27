import 'dart:convert';

import 'package:front_end_padelapp/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserServices {
  String urlIp = '192.168.1.38';
  String urlLocal = '10.0.2.2';

  Future<List<UserModel>> getUserData() async {
    try {
      var url =
          Uri.parse('http://$urlLocal:8080/paddlehub/user-management/v1/users');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var body = utf8.decode(response.bodyBytes);
        var data = jsonDecode(body) as List;
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

  Future<UserModel> getUserById(int id) async {
    try {
      var url = Uri.parse(
          'http://$urlLocal:8080/paddlehub/user-management/v1/users/$id');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var body = utf8.decode(response.bodyBytes);
        var data = jsonDecode(body);
        UserModel user = UserModel.fromJson(data);
        return user;
      } else {
        throw Exception('Failed to load user');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      var url = Uri.parse(
          'http://$urlLocal:8080/paddlehub/user-management/v1/users/${user.id}');
      var response = await http.put(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(user.toJson()));

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to update user');
      }
    } catch (e) {
      rethrow;
    }
  }
}
