import 'package:bloc/bloc.dart';
import 'package:status_app/models/user_model.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitial()) {
    
    on<ActivateUser>((event, emit) => emit(UserActive(event.user)));

    on<DeleteUser>((event, emit) => emit(const UserInitial()));

    on<ChangeAge>((event, emit) {
      if (state.user != null) {
        emit(UserActive(state.user!.copyWith(age: event.age)));
      }
    });

    on<AddProfession>((event, emit) {
      if (state.user != null) {
        final List<String> professions = [...state.user!.professions, event.profession];
        emit(UserActive(state.user!.copyWith(professions: professions)));
      }
    });
  }

}