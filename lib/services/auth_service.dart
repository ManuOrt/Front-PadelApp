import 'dart:convert';

import 'package:front_end_padelapp/models/models.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String urlIp = '192.168.1.38';
  String urlLocal = '10.0.2.2';

  Future<TokenDataModel> getAuthToken(String username, String password) async {
    try {
      var url = Uri.parse(
          'http://$urlLocal:8081/realms/spring-paddle-hub/protocol/openid-connect/token');
      var response = await http.post(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      }, body: {
        'username': username,
        'password': password,
        'grant_type': 'password',
        'client_id': 'paddle-hub-app',
        'client_secret': 'ZIYh1SdMONsel5Ey2PxlgnSXS1T0MBzs'
      });

      if (response.statusCode == 200) {
        var body = utf8.decode(response.bodyBytes);
        var data = TokenDataModel.fromJson(jsonDecode(body));
        return data;
      } else {
        throw Exception('Failed to get authentification token');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<TokenDataModel> getRefreshToken(String refreshToken) async {
    try {
      var url = Uri.parse(
          'http://$urlLocal:8081/realms/spring-paddle-hub/protocol/openid-connect/token');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
          },
          body: ({
            'refresh_token': refreshToken,
            'grant_type': 'refresh_token',
            'client_id': 'paddle-hub-app',
            'client_secret': 'ZIYh1SdMONsel5Ey2PxlgnSXS1T0MBzs'
          }));

      if (response.statusCode == 200) {
        var body = utf8.decode(response.bodyBytes);
        var data = TokenDataModel.fromJson(jsonDecode(body));
        return data;
      } else {
        throw Exception('Failed to get refresh token');
      }
    } catch (e) {
      rethrow;
    }
  }
}
