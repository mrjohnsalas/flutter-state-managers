part of 'user_bloc.dart';

@immutable
abstract class UserState {

  final bool userExist;
  final User? user;

  const UserState({this.userExist = false, required this.user});

}

class UserInitial extends UserState {
  const UserInitial() : super(userExist: false, user: null);
}

class UserActive extends UserState {
  const UserActive(user) : super(userExist: true, user: user);
}