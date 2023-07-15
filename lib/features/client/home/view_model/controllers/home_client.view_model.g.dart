// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_client.view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeClientViewModel on HomeClientViewModelBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'HomeClientViewModelBase.isLoading'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: 'HomeClientViewModelBase.hasError'))
          .value;
  Computed<bool>? _$isSuccessComputed;

  @override
  bool get isSuccess =>
      (_$isSuccessComputed ??= Computed<bool>(() => super.isSuccess,
              name: 'HomeClientViewModelBase.isSuccess'))
          .value;

  late final _$bottomBarIndexAtom =
      Atom(name: 'HomeClientViewModelBase.bottomBarIndex', context: context);

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
      Atom(name: 'HomeClientViewModelBase.tabActivityIndex', context: context);

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
      Atom(name: 'HomeClientViewModelBase.serviceSelected', context: context);

  @override
  SpecialityEntity? get serviceSelected {
    _$serviceSelectedAtom.reportRead();
    return super.serviceSelected;
  }

  @override
  set serviceSelected(SpecialityEntity? value) {
    _$serviceSelectedAtom.reportWrite(value, super.serviceSelected, () {
      super.serviceSelected = value;
    });
  }

  late final _$stateAtom =
      Atom(name: 'HomeClientViewModelBase.state', context: context);

  @override
  HomeClientScreenStatus get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(HomeClientScreenStatus value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$orderByListAtom =
      Atom(name: 'HomeClientViewModelBase.orderByList', context: context);

  @override
  int get orderByList {
    _$orderByListAtom.reportRead();
    return super.orderByList;
  }

  @override
  set orderByList(int value) {
    _$orderByListAtom.reportWrite(value, super.orderByList, () {
      super.orderByList = value;
    });
  }

  late final _$valuesRangeAtom =
      Atom(name: 'HomeClientViewModelBase.valuesRange', context: context);

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

  late final _$getHomeClientAsyncAction =
      AsyncAction('HomeClientViewModelBase.getHomeClient', context: context);

  @override
  Future<void> getHomeClient() {
    return _$getHomeClientAsyncAction.run(() => super.getHomeClient());
  }

  late final _$onClickBottomBarAsyncAction =
      AsyncAction('HomeClientViewModelBase.onClickBottomBar', context: context);

  @override
  Future<void> onClickBottomBar(int newIndex) {
    return _$onClickBottomBarAsyncAction
        .run(() => super.onClickBottomBar(newIndex));
  }

  late final _$HomeClientViewModelBaseActionController =
      ActionController(name: 'HomeClientViewModelBase', context: context);

  @override
  int setOrderByList(int newValue) {
    final _$actionInfo = _$HomeClientViewModelBaseActionController.startAction(
        name: 'HomeClientViewModelBase.setOrderByList');
    try {
      return super.setOrderByList(newValue);
    } finally {
      _$HomeClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int setbottomBarIndex(int newValue) {
    final _$actionInfo = _$HomeClientViewModelBaseActionController.startAction(
        name: 'HomeClientViewModelBase.setbottomBarIndex');
    try {
      return super.setbottomBarIndex(newValue);
    } finally {
      _$HomeClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  SfRangeValues setValuesRange(SfRangeValues newValue) {
    final _$actionInfo = _$HomeClientViewModelBaseActionController.startAction(
        name: 'HomeClientViewModelBase.setValuesRange');
    try {
      return super.setValuesRange(newValue);
    } finally {
      _$HomeClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  SpecialityEntity setServiceSelected(SpecialityEntity newValue) {
    final _$actionInfo = _$HomeClientViewModelBaseActionController.startAction(
        name: 'HomeClientViewModelBase.setServiceSelected');
    try {
      return super.setServiceSelected(newValue);
    } finally {
      _$HomeClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int setTabActivityIndex(int newValue) {
    final _$actionInfo = _$HomeClientViewModelBaseActionController.startAction(
        name: 'HomeClientViewModelBase.setTabActivityIndex');
    try {
      return super.setTabActivityIndex(newValue);
    } finally {
      _$HomeClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<Widget> buildListServics(HomeClientEntity screenData) {
    final _$actionInfo = _$HomeClientViewModelBaseActionController.startAction(
        name: 'HomeClientViewModelBase.buildListServics');
    try {
      return super.buildListServics(screenData);
    } finally {
      _$HomeClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPageSlide(int newIndexPage) {
    final _$actionInfo = _$HomeClientViewModelBaseActionController.startAction(
        name: 'HomeClientViewModelBase.onPageSlide');
    try {
      return super.onPageSlide(newIndexPage);
    } finally {
      _$HomeClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bottomBarIndex: ${bottomBarIndex},
tabActivityIndex: ${tabActivityIndex},
serviceSelected: ${serviceSelected},
state: ${state},
orderByList: ${orderByList},
valuesRange: ${valuesRange},
isLoading: ${isLoading},
hasError: ${hasError},
isSuccess: ${isSuccess}
    ''';
  }
}
