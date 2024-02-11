import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _showpassw = true;

  bool get password {
    return _showpassw;
  }

  updatePassword() {
    _showpassw = !_showpassw;
    notifyListeners();
  }
}
