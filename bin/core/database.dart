import '../models/user_dto.dart';

abstract class Database {
  Future<void> initialize();

  Future<List<UserDto>> getAllUsers();
  Future<UserDto> getUser(String id);
}

