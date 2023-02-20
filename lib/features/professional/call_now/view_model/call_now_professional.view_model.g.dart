// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_now_professional.view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CallNowProfessionalViewModel
    on _CallNowProfessionalViewModelBase, Store {
  late final _$screenStateAtom = Atom(
      name: '_CallNowProfessionalViewModelBase.screenState', context: context);

  @override
  CallNowProfessionalState get screenState {
    _$screenStateAtom.reportRead();
    return super.screenState;
  }

  @override
  set screenState(CallNowProfessionalState value) {
    _$screenStateAtom.reportWrite(value, super.screenState, () {
      super.screenState = value;
    });
  }

  late final _$statusTitleAtom = Atom(
      name: '_CallNowProfessionalViewModelBase.statusTitle', context: context);

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

  late final _$_CallNowProfessionalViewModelBaseActionController =
      ActionController(
          name: '_CallNowProfessionalViewModelBase', context: context);

  @override
  String setStatusTitle(String newState) {
    final _$actionInfo = _$_CallNowProfessionalViewModelBaseActionController
        .startAction(name: '_CallNowProfessionalViewModelBase.setStatusTitle');
    try {
      return super.setStatusTitle(newState);
    } finally {
      _$_CallNowProfessionalViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  CallNowProfessionalState setScreenState(CallNowProfessionalState newState) {
    final _$actionInfo = _$_CallNowProfessionalViewModelBaseActionController
        .startAction(name: '_CallNowProfessionalViewModelBase.setScreenState');
    try {
      return super.setScreenState(newState);
    } finally {
      _$_CallNowProfessionalViewModelBaseActionController
          .endAction(_$actionInfo);
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
