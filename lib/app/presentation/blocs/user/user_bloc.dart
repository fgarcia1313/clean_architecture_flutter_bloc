import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_all_users.dart';
import '../../../domain/usecases/get_user_by_id.dart';
import '../../../domain/usecases/create_user.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetAllUsers getAllUsers;
  final GetUserById getUserById;
  final CreateUser createUser;

  UserBloc(this.getAllUsers, this.getUserById, this.createUser) : super(UserInitial()) {
    // 1. Cargar todos los usuarios
    on<LoadAllUsersEvent>(_loadAllUsers);

    // 2. Cargar un usuario por ID
    on<LoadUserByIdEvent>(_loadUserById);

    // 3. Crear usuario
    on<CreateUserEvent>(_createUser);
  }

  Future<void> _loadAllUsers(LoadAllUsersEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final users = await getAllUsers();
      emit(UsersLoaded(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _loadUserById(LoadUserByIdEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final user = await getUserById(event.id);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _createUser(CreateUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final user = await createUser(event.user);
      emit(UserCreated(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
