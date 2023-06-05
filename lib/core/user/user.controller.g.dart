// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserController on _UserControllerBase, Store {
  late final _$userAuthenticatedAtom =
      Atom(name: '_UserControllerBase.userAuthenticated', context: context);

  @override
  User? get userAuthenticated {
    _$userAuthenticatedAtom.reportRead();
    return super.userAuthenticated;
  }

  @override
  set userAuthenticated(User? value) {
    _$userAuthenticatedAtom.reportWrite(value, super.userAuthenticated, () {
      super.userAuthenticated = value;
    });
  }

  late final _$saveUserOnDeviceAsyncAction =
      AsyncAction('_UserControllerBase.saveUserOnDevice', context: context);

  @override
  Future<void> saveUserOnDevice() {
    return _$saveUserOnDeviceAsyncAction.run(() => super.saveUserOnDevice());
  }

  late final _$getUserOnDeviceAsyncAction =
      AsyncAction('_UserControllerBase.getUserOnDevice', context: context);

  @override
  Future<User?> getUserOnDevice() {
    return _$getUserOnDeviceAsyncAction.run(() => super.getUserOnDevice());
  }

  late final _$_UserControllerBaseActionController =
      ActionController(name: '_UserControllerBase', context: context);

  @override
  User setUser(User newValue) {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.setUser');
    try {
      return super.setUser(newValue);
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userAuthenticated: ${userAuthenticated}
    ''';
  }
}
