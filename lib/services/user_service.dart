import 'dart:async';

import 'package:status_app/models/user_model.dart';

class UserService {
  User? _user;

  final StreamController<User> _userStreamController = StreamController<User>.broadcast();

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    _userStreamController.add(user);
  }

  Stream<User> get userStream => _userStreamController.stream;

  bool get isUserSet => _user != null;

  void changeAge(int age) {
    _user!.age = age;
    _userStreamController.add(_user!);
  }

  dispose() {
    _userStreamController.close();
  }
  
}

final userService = UserService();