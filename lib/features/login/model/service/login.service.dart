import 'package:ehelp/shared/entity/user/authenticate.entity.dart';

abstract class LoginService {
  Future<Authenticate> authenticate(
      final String username, final String password);
}
