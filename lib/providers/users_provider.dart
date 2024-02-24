import 'package:flutter/material.dart';
import 'package:front_end_padelapp/models/user_model.dart';
import 'package:front_end_padelapp/services/user_service.dart';

class UsersProvider extends ChangeNotifier {
  List<UserModel> users = [];

  getUsers() async {
    users = await UserServices().getUserData();
    notifyListeners();
    return users;
  }
}
