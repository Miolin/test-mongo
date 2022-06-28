import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../core/database.dart';
import '../models/user_dto.dart';

const _users = 'users';

@Singleton(as:  Database)
class MongoDatabase extends Database {
  late final Db _db;

  @override
  Future<void> initialize() async {
    _db = Db("mongodb://0.0.0.0:27017/test");
    await _db.open();
  }

  @override
  Future<List<UserDto>> getAllUsers() async {
    final collection = _db.collection(_users);
    final data = await collection.find().toList();
    return data.map(UserDto.fromJson).toList();
  }

  @override
  Future<UserDto> getUser(String id) async {
    final collection = _db.collection(_users);
    final data = await collection.findOne(SelectorBuilder().id(ObjectId.fromHexString(id)));
    return UserDto.fromJson(data!);
  }
}