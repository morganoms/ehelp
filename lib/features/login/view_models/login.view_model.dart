import 'package:ehelp/core/http/http_core_error.dart';
import 'package:ehelp/core/locator.dart';
import 'package:ehelp/core/user/user.controller.dart';
import 'package:ehelp/features/login/model/service/login.service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/models/screen_state.dart';
import '../../../shared/entity/user/user.entity.dart';
part 'login.view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  _LoginViewModelBase(this.datasource);

  final LoginService datasource;
  final UserController userController = locator.get<UserController>();

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
      final User user = await datasource.authenticate(username, password);
      userController.setUser(user);
      await userController.saveUserOnDevice();
      state = ScreenState.success;
      return user.userTypeId == UserType.prestador;
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
}
