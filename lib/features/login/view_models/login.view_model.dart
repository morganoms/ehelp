import 'package:ehelp/core/http/http_core_error.dart';
import 'package:ehelp/core/locator.dart';
import 'package:ehelp/core/token/token.controller.dart';
import 'package:ehelp/core/user/user.controller.dart';
import 'package:ehelp/features/login/model/service/login.service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/entity/user/authenticate.entity.dart';
import '../../../shared/entity/user/user.entity.dart';
import '../../../shared/models/screen_state.dart';
import '../../../shared/models/user_type.dart';

part 'login.view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  _LoginViewModelBase(this.datasource);
  final UserController userController = locator.get<UserController>();
  final TokenController tokenController = locator.get<TokenController>();

  final LoginService datasource;

  @observable
  ScreenState state = ScreenState.idle;

  @computed
  bool get isLoading => state == ScreenState.loading;
  @computed
  bool get hasError => state == ScreenState.error;

  @action
  ScreenState setLodaing(final ScreenState newValue) => state = newValue;

  @action
  Future<bool> authenticate(
      {required final String username, required final String password}) async {
    try {
      state = ScreenState.loading;
      await Future.delayed(const Duration(seconds: 3));
      final Authenticate authenticate =
          await datasource.authenticate(username, password);
      await saveInfoOnDevice(authenticate);
      state = ScreenState.success;
      return authenticate.userAutenticated.userTypeId == UserType.prestador;
    } on HttpCoreError catch (e) {
      state = ScreenState.error;
      debugPrint(e.message);
      return false;
    } on Exception catch (e) {
      state = ScreenState.error;
      debugPrint(e.toString());
      return false;
    }
  }

  Future<void> saveInfoOnDevice(Authenticate authenticate) async {
    userController.setUser(authenticate.userAutenticated);
    await userController.saveUserOnDevice();

    tokenController.setToken(authenticate.token);
    await tokenController.saveTokenOnDevice();
  }
}
