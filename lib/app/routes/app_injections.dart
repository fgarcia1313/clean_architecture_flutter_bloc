import '../presentation/blocs/user/user_bloc.dart';

// DATA
import '../data/datasources/user_remote_datasource.dart';
import '../data/repositories/user_repository_impl.dart';

// DOMAIN
import '../domain/usecases/get_all_users.dart';
import '../domain/usecases/get_user_by_id.dart';
import '../domain/usecases/create_user.dart';

class AppInjections {
  static UserRemoteDataSource provideUserDataSource() {
    return UserRemoteDataSourceImpl('https://jsonplaceholder.typicode.com');
  }

  static UserRepositoryImpl provideUserRepository() {
    return UserRepositoryImpl(provideUserDataSource());
  }

  static GetAllUsers provideGetAllUsers() {
    return GetAllUsers(provideUserRepository());
  }

  static GetUserById provideGetUserById() {
    return GetUserById(provideUserRepository());
  }

  static CreateUser provideCreateUser() {
    return CreateUser(provideUserRepository());
  }

  static UserBloc provideUserBloc() {
    return UserBloc(provideGetAllUsers(), provideGetUserById(), provideCreateUser());
  }
}
