import 'package:flutter/material.dart';
import 'package:front_end_padelapp/models/models.dart';
import 'package:front_end_padelapp/services/auth_service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthProvider extends ChangeNotifier {
  bool _showpassw = true;
  TokenDataModel? _tokenDataModel;
  final AuthService _authService = AuthService();

  bool get password {
    return _showpassw;
  }

  updatePassword() {
    _showpassw = !_showpassw;
    notifyListeners();
  }

  Future<TokenDataModel?> getAuthToken(String username, String password) async {
    _tokenDataModel = await _authService.getAuthToken(username, password);
    return _tokenDataModel;
  }

  getRefreshToken(String refreshToken) async {
    _tokenDataModel = await _authService.getRefreshToken(refreshToken);
  }

  String? getToken() {
    validateTokenExpiration();
    return _tokenDataModel?.accessToken;
  }

  validateTokenExpiration() {
    if (_tokenDataModel != null) {
      if (_tokenDataModel!.expiresIn != null) {
        if (JwtDecoder.isExpired(_tokenDataModel!.accessToken!)) {
          getRefreshToken(_tokenDataModel!.refreshToken!);
        }
      }
    }
  }

  String decodeToken() {
    return JwtDecoder.decode(_tokenDataModel!.accessToken!)['sub'];
  }
}
