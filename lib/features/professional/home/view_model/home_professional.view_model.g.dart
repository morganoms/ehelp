// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_professional.view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeProfessionalViewModel on HomeProfessionalViewModelBase, Store {
  late final _$bottomBarIndexAtom = Atom(
      name: 'HomeProfessionalViewModelBase.bottomBarIndex', context: context);

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
      name: 'HomeProfessionalViewModelBase.tabActivityIndex', context: context);

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
      name: 'HomeProfessionalViewModelBase.serviceSelected', context: context);

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
      name: 'HomeProfessionalViewModelBase.isAvaliableNow', context: context);

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

  late final _$showCallNowAtom =
      Atom(name: 'HomeProfessionalViewModelBase.showCallNow', context: context);

  @override
  bool get showCallNow {
    _$showCallNowAtom.reportRead();
    return super.showCallNow;
  }

  @override
  set showCallNow(bool value) {
    _$showCallNowAtom.reportWrite(value, super.showCallNow, () {
      super.showCallNow = value;
    });
  }

  late final _$loadingAvaliableAtom = Atom(
      name: 'HomeProfessionalViewModelBase.loadingAvaliable', context: context);

  @override
  bool get loadingAvaliable {
    _$loadingAvaliableAtom.reportRead();
    return super.loadingAvaliable;
  }

  @override
  set loadingAvaliable(bool value) {
    _$loadingAvaliableAtom.reportWrite(value, super.loadingAvaliable, () {
      super.loadingAvaliable = value;
    });
  }

  late final _$setAvaliableNowAsyncAction = AsyncAction(
      'HomeProfessionalViewModelBase.setAvaliableNow',
      context: context);

  @override
  Future<bool> setAvaliableNow(int userId) {
    return _$setAvaliableNowAsyncAction
        .run(() => super.setAvaliableNow(userId));
  }

  late final _$onClickBottomBarAsyncAction = AsyncAction(
      'HomeProfessionalViewModelBase.onClickBottomBar',
      context: context);

  @override
  Future<void> onClickBottomBar(int newIndex) {
    return _$onClickBottomBarAsyncAction
        .run(() => super.onClickBottomBar(newIndex));
  }

  late final _$HomeProfessionalViewModelBaseActionController =
      ActionController(name: 'HomeProfessionalViewModelBase', context: context);

  @override
  int setbottomBarIndex(int newValue) {
    final _$actionInfo = _$HomeProfessionalViewModelBaseActionController
        .startAction(name: 'HomeProfessionalViewModelBase.setbottomBarIndex');
    try {
      return super.setbottomBarIndex(newValue);
    } finally {
      _$HomeProfessionalViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String setServiceSelected(String newValue) {
    final _$actionInfo = _$HomeProfessionalViewModelBaseActionController
        .startAction(name: 'HomeProfessionalViewModelBase.setServiceSelected');
    try {
      return super.setServiceSelected(newValue);
    } finally {
      _$HomeProfessionalViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int setTabActivityIndex(int newValue) {
    final _$actionInfo = _$HomeProfessionalViewModelBaseActionController
        .startAction(name: 'HomeProfessionalViewModelBase.setTabActivityIndex');
    try {
      return super.setTabActivityIndex(newValue);
    } finally {
      _$HomeProfessionalViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPageSlide(int newIndexPage) {
    final _$actionInfo = _$HomeProfessionalViewModelBaseActionController
        .startAction(name: 'HomeProfessionalViewModelBase.onPageSlide');
    try {
      return super.onPageSlide(newIndexPage);
    } finally {
      _$HomeProfessionalViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bottomBarIndex: ${bottomBarIndex},
tabActivityIndex: ${tabActivityIndex},
serviceSelected: ${serviceSelected},
isAvaliableNow: ${isAvaliableNow},
showCallNow: ${showCallNow},
loadingAvaliable: ${loadingAvaliable}
    ''';
  }
}
