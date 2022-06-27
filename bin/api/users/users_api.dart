import '../../core/api.dart';
import '../../core/request_handler.dart';
import 'handlers/all_users.dart';
import 'handlers/single_user.dart';

class UsersApi extends Api {
  @override
  String get apiPath => '/users';

  @override
  List<RequestHandler> get handlers => [
    AllUsersHandler(),
    SingleUserHandler(),
  ];
}