import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'core/database.dart';
import 'core/utils.dart';
import 'api/users/users_api.dart';


void main(List<String> args) async {
  final app = Router();
  final userApi = UsersApi();
  Database.instance.initialize();

  app.mountApi(userApi);

  final handler = Pipeline().addMiddleware(logRequests()).addHandler(app);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  await serve(handler, 'localhost', port);
}
