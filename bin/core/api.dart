import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'request_handler.dart';

abstract class Api {
  String get apiPath;
  List<RequestHandler> get handlers;
  List<Middleware> get middleware => [];

  void init(Router router) {
    final apiRouter = Router(notFoundHandler: notFoundHandler);
    for (var handler in handlers) {
      final secondVariant = handler.path.substring(handler.path.length) == '/'
          ? handler.path.substring(0, handler.path.length)
          : '${handler.path}/';
      apiRouter.all(handler.path, handler.handle);
      apiRouter.all(secondVariant, handler.handle);
    }
    apiRouter.all('/<ignored|.*>', notFoundHandler);

    Handler handler = apiRouter;
    for (final service in middleware) {
      handler = Pipeline().addMiddleware(service).addHandler(handler);
    }

    router.mount(apiPath, apiRouter);
  }

  Future<Response> notFoundHandler(Request request) async {
    return Router.routeNotFound;
  }
}
