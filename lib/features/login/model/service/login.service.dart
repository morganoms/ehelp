import '../../../../shared/entity/user/user.entity.dart';

abstract class LoginService {
  Future<User> authenticate(final String username, final String password);
}
