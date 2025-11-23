import 'package:http/http.dart' as http;
import 'dart:convert';

import '../dto/user_dto.dart';

abstract class UserRemoteDataSource {
  Future<UserDTO> getUserById(int id);
  Future<List<UserDTO>> getAllUsers();
  Future<UserDTO> createUser(UserDTO dto);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final String baseUrl;

  UserRemoteDataSourceImpl(this.baseUrl);

  @override
  Future<UserDTO> getUserById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$id'));

    final jsonMap = json.decode(response.body);
    return UserDTO.fromJson(jsonMap);
  }

  @override
  Future<List<UserDTO>> getAllUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    final List<dynamic> jsonList = json.decode(response.body);

    return jsonList.map((e) => UserDTO.fromJson(e)).toList();
  }

  @override
  Future<UserDTO> createUser(UserDTO dto) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      body: json.encode(dto.toJson()),
      headers: { "Content-Type": "application/json" },
    );

    final jsonMap = json.decode(response.body);
    return UserDTO.fromJson(jsonMap);
  }
}
