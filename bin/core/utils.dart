import 'package:shelf_router/shelf_router.dart';

import 'api.dart';

extension RouterExt on Router {
  mountApi(Api api) {
    api.init(this);
  }
}