import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'core/api.dart';
import 'core/database.dart';
import 'core/utils.dart';
import 'api/users/users_api.dart';
import 'di/injector.dart';


void main(List<String> args) async {
  await Injector.instance.configure();

  final apis = <Api>[
    Injector.instance.resolve<UsersApi>(),
    //TODO: connect new api
  ];

  Injector.instance.resolve<Database>().initialize();

  final app = Router();
  for (final api in apis) {
    app.mountApi(api);
  }

  final handler = Pipeline().addMiddleware(logRequests()).addHandler(app);
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  await serve(handler, 'localhost', port);
}
