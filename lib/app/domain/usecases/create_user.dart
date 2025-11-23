import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class CreateUser {
  final UserRepository repository;

  CreateUser(this.repository);

  Future<UserEntity> call(UserEntity user) async {
    if (user.website.isEmpty) {
      throw Exception("El usuario no tiene pagina web.");
    }

    return await repository.createUser(user);
  }
}
