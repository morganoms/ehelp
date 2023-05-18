import 'package:ehelp/core/http/http_core_error.dart';
import 'package:ehelp/features/login/models/datasource/login.datasource.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/models/screen_state.dart';
part 'login.view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  _LoginViewModelBase(this.datasource);

  final LoginDatasource datasource;

  @observable
  ScreenState state = ScreenState.idle;

  @computed
  bool get isLoading => state == ScreenState.loading;
  @computed
  bool get hasError => state == ScreenState.error;

  @action
  ScreenState setLodaing(final ScreenState newValue) => state = newValue;

  @action
  Future<void> authenticate(
      {required final String username, required final String password}) async {
    try {
      state = ScreenState.loading;
      await Future.delayed(const Duration(seconds: 3));
      await datasource.authenticate(username, password);
      state = ScreenState.success;
    } on HttpCoreError catch (e) {
      state = ScreenState.error;
      debugPrint(e.message);
    } on Exception catch (e) {
      state = ScreenState.error;
      debugPrint(e.toString());
    }
  }
}
