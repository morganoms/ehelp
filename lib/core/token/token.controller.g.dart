// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TokenController on TokenControllerBase, Store {
  late final _$tokenAtom =
      Atom(name: 'TokenControllerBase.token', context: context);

  @override
  String? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$saveTokenOnDeviceAsyncAction =
      AsyncAction('TokenControllerBase.saveTokenOnDevice', context: context);

  @override
  Future<void> saveTokenOnDevice() {
    return _$saveTokenOnDeviceAsyncAction.run(() => super.saveTokenOnDevice());
  }

  late final _$getTokenOnDeviceAsyncAction =
      AsyncAction('TokenControllerBase.getTokenOnDevice', context: context);

  @override
  Future<String?> getTokenOnDevice() {
    return _$getTokenOnDeviceAsyncAction.run(() => super.getTokenOnDevice());
  }

  late final _$TokenControllerBaseActionController =
      ActionController(name: 'TokenControllerBase', context: context);

  @override
  String setToken(String newValue) {
    final _$actionInfo = _$TokenControllerBaseActionController.startAction(
        name: 'TokenControllerBase.setToken');
    try {
      return super.setToken(newValue);
    } finally {
      _$TokenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
token: ${token}
    ''';
  }
}
