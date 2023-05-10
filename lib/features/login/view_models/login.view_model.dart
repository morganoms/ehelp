import 'package:ehelp/core/http/http_core_error.dart';
import 'package:ehelp/features/login/models/datasource/login.datasource.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login.view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  _LoginViewModelBase(this.datasource);

  final LoginDatasource datasource;

  @observable
  bool isLoading = false;

  @action
  bool setLodaing(final bool newValue) => isLoading = newValue;

  @action
  Future<void> authenticate(
      {required final String email, required final String password}) async {
    try {
      isLoading = true;
      await Future.delayed(const Duration(seconds: 3));
      await datasource.authenticate(email, password);
      isLoading = false;
    } on HttpCoreError catch (e) {
      debugPrint(e.message);
    }
  }
}
