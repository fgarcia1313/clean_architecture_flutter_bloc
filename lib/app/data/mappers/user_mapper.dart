import '../dto/user_dto.dart';
import '../models/user_model.dart';
import '../../domain/entities/user_entity.dart';

class UserMapper {

  // DTO → Model
  static UserModel fromDTO(UserDTO dto) {
    return UserModel(
      id: dto.id,
      name: dto.name,
      email: dto.email,
      website: dto.website,
    );
  }

  // Model → Entity
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      website: model.website,
    );
  }

  // Entity → Model (solo si lo necesitas)
  static UserModel fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      website: entity.website,
    );
  }
}
