// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_client.view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeClientViewModel on _HomeClientViewModelBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_HomeClientViewModelBase.isLoading'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_HomeClientViewModelBase.hasError'))
          .value;
  Computed<bool>? _$isSuccessComputed;

  @override
  bool get isSuccess =>
      (_$isSuccessComputed ??= Computed<bool>(() => super.isSuccess,
              name: '_HomeClientViewModelBase.isSuccess'))
          .value;

  late final _$bottomBarIndexAtom =
      Atom(name: '_HomeClientViewModelBase.bottomBarIndex', context: context);

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

  late final _$tabActivityIndexAtom =
      Atom(name: '_HomeClientViewModelBase.tabActivityIndex', context: context);

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

  late final _$serviceSelectedAtom =
      Atom(name: '_HomeClientViewModelBase.serviceSelected', context: context);

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

  late final _$stateAtom =
      Atom(name: '_HomeClientViewModelBase.state', context: context);

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

  late final _$valuesRangeAtom =
      Atom(name: '_HomeClientViewModelBase.valuesRange', context: context);

  @override
  SfRangeValues get valuesRange {
    _$valuesRangeAtom.reportRead();
    return super.valuesRange;
  }

  @override
  set valuesRange(SfRangeValues value) {
    _$valuesRangeAtom.reportWrite(value, super.valuesRange, () {
      super.valuesRange = value;
    });
  }

  late final _$onClickBottomBarAsyncAction = AsyncAction(
      '_HomeClientViewModelBase.onClickBottomBar',
      context: context);

  @override
  Future<void> onClickBottomBar(int newIndex) {
    return _$onClickBottomBarAsyncAction
        .run(() => super.onClickBottomBar(newIndex));
  }

  late final _$_HomeClientViewModelBaseActionController =
      ActionController(name: '_HomeClientViewModelBase', context: context);

  @override
  int setbottomBarIndex(int newValue) {
    final _$actionInfo = _$_HomeClientViewModelBaseActionController.startAction(
        name: '_HomeClientViewModelBase.setbottomBarIndex');
    try {
      return super.setbottomBarIndex(newValue);
    } finally {
      _$_HomeClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  ScreenState setState(ScreenState newValue) {
    final _$actionInfo = _$_HomeClientViewModelBaseActionController.startAction(
        name: '_HomeClientViewModelBase.setState');
    try {
      return super.setState(newValue);
    } finally {
      _$_HomeClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  SfRangeValues setValuesRange(SfRangeValues newValue) {
    final _$actionInfo = _$_HomeClientViewModelBaseActionController.startAction(
        name: '_HomeClientViewModelBase.setValuesRange');
    try {
      return super.setValuesRange(newValue);
    } finally {
      _$_HomeClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String setServiceSelected(String newValue) {
    final _$actionInfo = _$_HomeClientViewModelBaseActionController.startAction(
        name: '_HomeClientViewModelBase.setServiceSelected');
    try {
      return super.setServiceSelected(newValue);
    } finally {
      _$_HomeClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int setTabActivityIndex(int newValue) {
    final _$actionInfo = _$_HomeClientViewModelBaseActionController.startAction(
        name: '_HomeClientViewModelBase.setTabActivityIndex');
    try {
      return super.setTabActivityIndex(newValue);
    } finally {
      _$_HomeClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPageSlide(int newIndexPage) {
    final _$actionInfo = _$_HomeClientViewModelBaseActionController.startAction(
        name: '_HomeClientViewModelBase.onPageSlide');
    try {
      return super.onPageSlide(newIndexPage);
    } finally {
      _$_HomeClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bottomBarIndex: ${bottomBarIndex},
tabActivityIndex: ${tabActivityIndex},
serviceSelected: ${serviceSelected},
state: ${state},
valuesRange: ${valuesRange},
isLoading: ${isLoading},
hasError: ${hasError},
isSuccess: ${isSuccess}
    ''';
  }
}
