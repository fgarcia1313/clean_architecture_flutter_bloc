import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUserById(int id);
  Future<List<UserEntity>> getAllUsers();
  Future<UserEntity> createUser(UserEntity user);
}
