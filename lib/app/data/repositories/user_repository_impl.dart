import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';

import '../datasources/user_remote_datasource.dart';
import '../dto/user_dto.dart';
import '../mappers/user_mapper.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserEntity> getUserById(int id) async {
    final dto = await remoteDataSource.getUserById(id);
    final model = UserMapper.fromDTO(dto);
    final entity = UserMapper.toEntity(model);
    return entity;
  }

  @override
  Future<List<UserEntity>> getAllUsers() async {
    final dtoList = await remoteDataSource.getAllUsers();

    final models = dtoList.map((dto) => UserMapper.fromDTO(dto)).toList();
    final entities = models.map((model) => UserMapper.toEntity(model)).toList();

    return entities;
  }

  @override
  Future<UserEntity> createUser(UserEntity user) async {
    // Convertimos la entity a model
    final model = UserMapper.fromEntity(user);

    // Convertimos el model a DTO para enviarlo al backend
    final dtoToSend = UserDTO(
      id: model.id,
      name: model.name,
      email: model.email,
      website: model.website,
    );

    final dtoResponse = await remoteDataSource.createUser(dtoToSend);

    final modelResponse = UserMapper.fromDTO(dtoResponse);
    final entityResponse = UserMapper.toEntity(modelResponse);

    return entityResponse;
  }
}
