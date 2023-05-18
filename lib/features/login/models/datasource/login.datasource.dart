import '../entity/user.entity.dart';

abstract class LoginDatasource {
  Future<User> authenticate(final String username, final String password);
}
