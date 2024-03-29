import 'package:ehelp/core/new_http/http_client.dart';
import 'package:ehelp/core/session/session_core.service.dart';
import 'package:ehelp/shared/entity/user/authenticate.entity.dart';
import 'package:mobx/mobx.dart';

part 'session.controller.g.dart';

class SessionController = _SessionControllerBase with _$SessionController;

abstract class _SessionControllerBase with Store {
  _SessionControllerBase();

  final SessionCoreServise sessionServise =
      SessionCoreServise(HttpCoreClient());

  @observable
  Authenticate? session;

  @action
  Authenticate setSession(final Authenticate newValue) => session = newValue;

  @action
  Future<void> saveSessionOnDevice() async {
    if (session != null) {
      await sessionServise.saveSession(session!);
    }
  }

  @action
  Future<Authenticate?> getSessionFromDevice() async {
    final Authenticate? sessionTemp = await sessionServise.getSession();
    session = sessionTemp;

    return sessionTemp;
  }

  @action
  Future<void> removeSessionFromDevice() async {
    await sessionServise.removeSession();
  }

  @action
  Future<String> refreshSession() =>
      sessionServise.refreshToken(session?.refreshToken ?? '');
}
