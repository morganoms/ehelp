import 'package:ehelp/core/token/token_core.service.dart';
import 'package:mobx/mobx.dart';
part 'token.controller.g.dart';

class TokenController = TokenControllerBase with _$TokenController;

abstract class TokenControllerBase with Store {
  TokenControllerBase();

  final TokenCoreServise tokenService = TokenCoreServise();

  @observable
  String? token;

  @action
  String setToken(final String newValue) => token = newValue;

  @action
  Future<void> saveTokenOnDevice() async {
    if (token != null) {
      await tokenService.saveToken(token!);
    }
  }
}
