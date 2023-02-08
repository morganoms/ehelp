// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_professional.view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeProfessionalViewModel on _HomeProfessionalViewModelBase, Store {
  late final _$bottomBarIndexAtom = Atom(
      name: '_HomeProfessionalViewModelBase.bottomBarIndex', context: context);

  @override
  int get bottomBarIndex {
    _$bottomBarIndexAtom.reportRead();
    return super.bottomBarIndex;
  }

  @override
  set bottomBarIndex(int value) {
    _$bottomBarIndexAtom.reportWrite(value, super.bottomBarIndex, () {
      super.bottomBarIndex = value;
    });
  }

  late final _$tabActivityIndexAtom = Atom(
      name: '_HomeProfessionalViewModelBase.tabActivityIndex',
      context: context);

  @override
  int get tabActivityIndex {
    _$tabActivityIndexAtom.reportRead();
    return super.tabActivityIndex;
  }

  @override
  set tabActivityIndex(int value) {
    _$tabActivityIndexAtom.reportWrite(value, super.tabActivityIndex, () {
      super.tabActivityIndex = value;
    });
  }

  late final _$serviceSelectedAtom = Atom(
      name: '_HomeProfessionalViewModelBase.serviceSelected', context: context);

  @override
  String get serviceSelected {
    _$serviceSelectedAtom.reportRead();
    return super.serviceSelected;
  }

  @override
  set serviceSelected(String value) {
    _$serviceSelectedAtom.reportWrite(value, super.serviceSelected, () {
      super.serviceSelected = value;
    });
  }

  late final _$isAvaliableNowAtom = Atom(
      name: '_HomeProfessionalViewModelBase.isAvaliableNow', context: context);

  @override
  bool get isAvaliableNow {
    _$isAvaliableNowAtom.reportRead();
    return super.isAvaliableNow;
  }

  @override
  set isAvaliableNow(bool value) {
    _$isAvaliableNowAtom.reportWrite(value, super.isAvaliableNow, () {
      super.isAvaliableNow = value;
    });
  }

  late final _$onClickBottomBarAsyncAction = AsyncAction(
      '_HomeProfessionalViewModelBase.onClickBottomBar',
      context: context);

  @override
  Future<void> onClickBottomBar(int newIndex) {
    return _$onClickBottomBarAsyncAction
        .run(() => super.onClickBottomBar(newIndex));
  }

  late final _$_HomeProfessionalViewModelBaseActionController =
      ActionController(
          name: '_HomeProfessionalViewModelBase', context: context);

  @override
  bool setAvaliableNow(bool newValue) {
    final _$actionInfo = _$_HomeProfessionalViewModelBaseActionController
        .startAction(name: '_HomeProfessionalViewModelBase.setAvaliableNow');
    try {
      return super.setAvaliableNow(newValue);
    } finally {
      _$_HomeProfessionalViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int setbottomBarIndex(int newValue) {
    final _$actionInfo = _$_HomeProfessionalViewModelBaseActionController
        .startAction(name: '_HomeProfessionalViewModelBase.setbottomBarIndex');
    try {
      return super.setbottomBarIndex(newValue);
    } finally {
      _$_HomeProfessionalViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String setServiceSelected(String newValue) {
    final _$actionInfo = _$_HomeProfessionalViewModelBaseActionController
        .startAction(name: '_HomeProfessionalViewModelBase.setServiceSelected');
    try {
      return super.setServiceSelected(newValue);
    } finally {
      _$_HomeProfessionalViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int setTabActivityIndex(int newValue) {
    final _$actionInfo =
        _$_HomeProfessionalViewModelBaseActionController.startAction(
            name: '_HomeProfessionalViewModelBase.setTabActivityIndex');
    try {
      return super.setTabActivityIndex(newValue);
    } finally {
      _$_HomeProfessionalViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPageSlide(int newIndexPage) {
    final _$actionInfo = _$_HomeProfessionalViewModelBaseActionController
        .startAction(name: '_HomeProfessionalViewModelBase.onPageSlide');
    try {
      return super.onPageSlide(newIndexPage);
    } finally {
      _$_HomeProfessionalViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bottomBarIndex: ${bottomBarIndex},
tabActivityIndex: ${tabActivityIndex},
serviceSelected: ${serviceSelected},
isAvaliableNow: ${isAvaliableNow}
    ''';
  }
}
