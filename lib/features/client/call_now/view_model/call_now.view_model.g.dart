// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_now.view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CallNowViewModel on _CallNowViewModelBase, Store {
  late final _$screenStateAtom =
      Atom(name: '_CallNowViewModelBase.screenState', context: context);

  @override
  CallNowState get screenState {
    _$screenStateAtom.reportRead();
    return super.screenState;
  }

  @override
  set screenState(CallNowState value) {
    _$screenStateAtom.reportWrite(value, super.screenState, () {
      super.screenState = value;
    });
  }

  late final _$statusTitleAtom =
      Atom(name: '_CallNowViewModelBase.statusTitle', context: context);

  @override
  String get statusTitle {
    _$statusTitleAtom.reportRead();
    return super.statusTitle;
  }

  @override
  set statusTitle(String value) {
    _$statusTitleAtom.reportWrite(value, super.statusTitle, () {
      super.statusTitle = value;
    });
  }

  late final _$_CallNowViewModelBaseActionController =
      ActionController(name: '_CallNowViewModelBase', context: context);

  @override
  String setStatusTitle(String newState) {
    final _$actionInfo = _$_CallNowViewModelBaseActionController.startAction(
        name: '_CallNowViewModelBase.setStatusTitle');
    try {
      return super.setStatusTitle(newState);
    } finally {
      _$_CallNowViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  CallNowState setScreenState(CallNowState newState) {
    final _$actionInfo = _$_CallNowViewModelBaseActionController.startAction(
        name: '_CallNowViewModelBase.setScreenState');
    try {
      return super.setScreenState(newState);
    } finally {
      _$_CallNowViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
screenState: ${screenState},
statusTitle: ${statusTitle}
    ''';
  }
}
