import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:status_app/models/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void setUser(User user) => emit(UserActive(user));

  void changeAge(int age) {
    final currentState = state;
    if (currentState is UserActive) {
      emit(UserActive(currentState.user.copyWith(age: age)));
    }
  }

  void addProfession(String profession) {
    final currentState = state;
    if (currentState is UserActive) {
      emit(UserActive(currentState.user.copyWith(professions: [...currentState.user.professions, profession])));
    }
  }

  void clearUser() => emit(UserInitial());
}
