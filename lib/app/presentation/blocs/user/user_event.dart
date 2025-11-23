import '../../../domain/entities/user_entity.dart';

abstract class UserEvent {}

class LoadAllUsersEvent extends UserEvent {}

class LoadUserByIdEvent extends UserEvent {
  final int id;
  LoadUserByIdEvent(this.id);
}

class CreateUserEvent extends UserEvent {
  final UserEntity user;
  CreateUserEvent(this.user);
}
