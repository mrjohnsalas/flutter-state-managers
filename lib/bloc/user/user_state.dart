part of 'user_cubit.dart';

@immutable
sealed class UserState {}

class UserInitial extends UserState {
  final userExist = false;
}

class UserActive extends UserState {
  final userExist = true;
  final User user;

  UserActive(this.user);
}
