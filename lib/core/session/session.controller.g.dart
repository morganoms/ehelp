// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SessionController on _SessionControllerBase, Store {
  late final _$sessionAtom =
      Atom(name: '_SessionControllerBase.session', context: context);

  @override
  Authenticate? get session {
    _$sessionAtom.reportRead();
    return super.session;
  }

  @override
  set session(Authenticate? value) {
    _$sessionAtom.reportWrite(value, super.session, () {
      super.session = value;
    });
  }

  late final _$saveSessionOnDeviceAsyncAction = AsyncAction(
      '_SessionControllerBase.saveSessionOnDevice',
      context: context);

  @override
  Future<void> saveSessionOnDevice() {
    return _$saveSessionOnDeviceAsyncAction
        .run(() => super.saveSessionOnDevice());
  }

  late final _$getSessionFromDeviceAsyncAction = AsyncAction(
      '_SessionControllerBase.getSessionFromDevice',
      context: context);

  @override
  Future<Authenticate?> getSessionFromDevice() {
    return _$getSessionFromDeviceAsyncAction
        .run(() => super.getSessionFromDevice());
  }

  late final _$removeSessionFromDeviceAsyncAction = AsyncAction(
      '_SessionControllerBase.removeSessionFromDevice',
      context: context);

  @override
  Future<void> removeSessionFromDevice() {
    return _$removeSessionFromDeviceAsyncAction
        .run(() => super.removeSessionFromDevice());
  }

  late final _$refreshSessionAsyncAction =
      AsyncAction('_SessionControllerBase.refreshSession', context: context);

  @override
  Future<void> refreshSession() {
    return _$refreshSessionAsyncAction.run(() => super.refreshSession());
  }

  late final _$_SessionControllerBaseActionController =
      ActionController(name: '_SessionControllerBase', context: context);

  @override
  Authenticate setSession(Authenticate newValue) {
    final _$actionInfo = _$_SessionControllerBaseActionController.startAction(
        name: '_SessionControllerBase.setSession');
    try {
      return super.setSession(newValue);
    } finally {
      _$_SessionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
session: ${session}
    ''';
  }
}
