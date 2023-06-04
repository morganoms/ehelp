import 'package:ehelp/core/user/user_core.service.dart';
import 'package:ehelp/shared/entity/user/user.entity.dart';
import 'package:mobx/mobx.dart';
part 'user.controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  _UserControllerBase();

  final UserCoreServise userServise = UserCoreServise();

  @observable
  User? userAuthenticated;

  @action
  User setUser(final User newValue) => userAuthenticated = newValue;

  @action
  Future<void> saveUserOnDevice() async {
    if (userAuthenticated != null) {
      await userServise.saveUser(userAuthenticated!);
    }
  }

  @action
  Future<User?> getUserOnDevice() async {
    final User? userTemp = await userServise.getUser();
    userAuthenticated = userTemp;
    return userTemp;
  }
}
