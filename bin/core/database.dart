import '../database/mongo_db.dart';
import '../models/user_dto.dart';

abstract class Database {
  static final Database instance = MongoDatabase();

  Future<void> initialize();

  Future<List<UserDto>> getAllUsers();
  Future<UserDto> getUser(String id);
}

