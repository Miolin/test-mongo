import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';

import '../../../core/database.dart';
import '../../../core/request_handler.dart';

@Injectable()
class AllUsersHandler extends RequestHandler {
  final Database _database;

  const AllUsersHandler(this._database) : super('/');

  @override
  Future<Response> get(Request request) async {
    final users = await _database.getAllUsers();
    return jsonResponse({
      'users': users,
    });
  }
}
