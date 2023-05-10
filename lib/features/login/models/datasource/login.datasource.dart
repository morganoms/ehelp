import '../entity/user.entity.dart';

abstract class LoginDatasource {
  Future<User> authenticate(final String email, final String password);
}
