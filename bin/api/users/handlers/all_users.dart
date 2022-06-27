import 'package:shelf/shelf.dart';

import '../../../core/database.dart';
import '../../../core/request_handler.dart';

class AllUsersHandler extends RequestHandler {

  @override
  Future<Response> get(Request request) async {
    final users = await Database.instance.getAllUsers();
    return jsonResponse({
      'users': users,
    });
  }

  @override
  String get path => '/';
}