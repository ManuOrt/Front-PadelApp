import 'package:flutter/material.dart';
import 'package:front_end_padelapp/models/user_model.dart';
import 'package:front_end_padelapp/services/user_service.dart';

class UsersProvider extends ChangeNotifier {
  List<UserModel> users = [];
  UserModel? user;

  getUsers(String token) async {
    users = await UserServices().getUserData(token);
    notifyListeners();
    return users;
  }

  Future<UserModel> getUserById(String id, String token) async {
    user = await UserServices().getUserById(id, token);
    notifyListeners();
    return user!;
  }

  void setCurrentUser(UserModel user) {
    this.user = user;
    notifyListeners();
  }

  void updateUser(UserModel user, String token) {
    UserServices().updateUser(user, token);
    this.user = user;
    notifyListeners();
  }
}
