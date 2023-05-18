// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_LoginViewModelBase.isLoading'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_LoginViewModelBase.hasError'))
          .value;

  late final _$stateAtom =
      Atom(name: '_LoginViewModelBase.state', context: context);

  @override
  ScreenState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ScreenState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$authenticateAsyncAction =
      AsyncAction('_LoginViewModelBase.authenticate', context: context);

  @override
  Future<void> authenticate(
      {required String username, required String password}) {
    return _$authenticateAsyncAction
        .run(() => super.authenticate(username: username, password: password));
  }

  late final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase', context: context);

  @override
  ScreenState setLodaing(ScreenState newValue) {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.setLodaing');
    try {
      return super.setLodaing(newValue);
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
isLoading: ${isLoading},
hasError: ${hasError}
    ''';
  }
}
