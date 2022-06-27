import 'package:shelf/src/request.dart';

import 'package:shelf/src/response.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../core/database.dart';
import '../../../core/request_handler.dart';


class SingleUserHandler extends RequestHandler {

  @override
  Future<Response> get(Request request) async {
    final id = request.params['id'] as String;
    final user = await Database.instance.getUser(id);
    return jsonResponse(user);
  }

  @override
  String get path => '/<id|.*>';
}