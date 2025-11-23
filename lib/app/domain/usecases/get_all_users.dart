import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetAllUsers {
  final UserRepository repository;

  GetAllUsers(this.repository);

  Future<List<UserEntity>> call() async {
    return await repository.getAllUsers();
  }
}
