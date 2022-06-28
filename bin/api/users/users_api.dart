import 'package:injectable/injectable.dart';

import '../../core/api.dart';
import '../../core/request_handler.dart';
import 'handlers/all_users.dart';
import 'handlers/single_user.dart';

const _apiPath = '/users';

@Singleton()
class UsersApi extends Api {
  final AllUsersHandler _allUsersHandler;
  final SingleUserHandler _singleUserHandler;

  const UsersApi(
    this._allUsersHandler,
    this._singleUserHandler,
  ) : super(apiPath: _apiPath);

  @override
  List<RequestHandler> get handlers => [_allUsersHandler, _singleUserHandler];
}
