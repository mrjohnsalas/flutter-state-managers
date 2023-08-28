import 'package:flutter/material.dart';
import 'package:status_app/models/user_model.dart';

class UserService with ChangeNotifier {
  User? _user;

  User get user => _user!;
  bool get existsUser => _user != null;

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  void changeAge(int age) {
    _user!.age = age;
    notifyListeners();
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }

  void addProfession(String profession) {
    _user!.professions.add(profession);
    notifyListeners();
  }
}