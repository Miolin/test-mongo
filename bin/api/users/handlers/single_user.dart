import 'package:injectable/injectable.dart';
import 'package:shelf/src/request.dart';
import 'package:shelf/src/response.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../core/database.dart';
import '../../../core/request_handler.dart';

@Injectable()
class SingleUserHandler extends RequestHandler {
  final Database _database;

  const SingleUserHandler(this._database) : super('/<id|.*>');

  @override
  Future<Response> get(Request request) async {
    final id = request.params['id'] as String;
    final user = await _database.getUser(id);
    return jsonResponse(user);
  }
}
