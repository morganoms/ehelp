// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_edit_area.view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeEditAreaViewModel on _HomeEditAreaViewModelBase, Store {
  late final _$isUtilDaysAtom =
      Atom(name: '_HomeEditAreaViewModelBase.isUtilDays', context: context);

  @override
  bool get isUtilDays {
    _$isUtilDaysAtom.reportRead();
    return super.isUtilDays;
  }

  @override
  set isUtilDays(bool value) {
    _$isUtilDaysAtom.reportWrite(value, super.isUtilDays, () {
      super.isUtilDays = value;
    });
  }

  late final _$isComercialHoursAtom = Atom(
      name: '_HomeEditAreaViewModelBase.isComercialHours', context: context);

  @override
  bool get isComercialHours {
    _$isComercialHoursAtom.reportRead();
    return super.isComercialHours;
  }

  @override
  set isComercialHours(bool value) {
    _$isComercialHoursAtom.reportWrite(value, super.isComercialHours, () {
      super.isComercialHours = value;
    });
  }

  late final _$valuChargedAtom =
      Atom(name: '_HomeEditAreaViewModelBase.valuCharged', context: context);

  @override
  double get valuCharged {
    _$valuChargedAtom.reportRead();
    return super.valuCharged;
  }

  @override
  set valuCharged(double value) {
    _$valuChargedAtom.reportWrite(value, super.valuCharged, () {
      super.valuCharged = value;
    });
  }

  late final _$certificationListAtom = Atom(
      name: '_HomeEditAreaViewModelBase.certificationList', context: context);

  @override
  ObservableList<String> get certificationList {
    _$certificationListAtom.reportRead();
    return super.certificationList;
  }

  @override
  set certificationList(ObservableList<String> value) {
    _$certificationListAtom.reportWrite(value, super.certificationList, () {
      super.certificationList = value;
    });
  }

  late final _$workDaysListAtom =
      Atom(name: '_HomeEditAreaViewModelBase.workDaysList', context: context);

  @override
  ObservableList<WeekDays> get workDaysList {
    _$workDaysListAtom.reportRead();
    return super.workDaysList;
  }

  @override
  set workDaysList(ObservableList<WeekDays> value) {
    _$workDaysListAtom.reportWrite(value, super.workDaysList, () {
      super.workDaysList = value;
    });
  }

  late final _$workHoursListAtom =
      Atom(name: '_HomeEditAreaViewModelBase.workHoursList', context: context);

  @override
  ObservableList<WorkingHours> get workHoursList {
    _$workHoursListAtom.reportRead();
    return super.workHoursList;
  }

  @override
  set workHoursList(ObservableList<WorkingHours> value) {
    _$workHoursListAtom.reportWrite(value, super.workHoursList, () {
      super.workHoursList = value;
    });
  }

  late final _$_HomeEditAreaViewModelBaseActionController =
      ActionController(name: '_HomeEditAreaViewModelBase', context: context);

  @override
  double setValueCharged(double value) {
    final _$actionInfo = _$_HomeEditAreaViewModelBaseActionController
        .startAction(name: '_HomeEditAreaViewModelBase.setValueCharged');
    try {
      return super.setValueCharged(value);
    } finally {
      _$_HomeEditAreaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectionWeekDay(int index, bool value) {
    final _$actionInfo = _$_HomeEditAreaViewModelBaseActionController
        .startAction(name: '_HomeEditAreaViewModelBase.setSelectionWeekDay');
    try {
      return super.setSelectionWeekDay(index, value);
    } finally {
      _$_HomeEditAreaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectionWorkHour(int index, bool value) {
    final _$actionInfo = _$_HomeEditAreaViewModelBaseActionController
        .startAction(name: '_HomeEditAreaViewModelBase.setSelectionWorkHour');
    try {
      return super.setSelectionWorkHour(index, value);
    } finally {
      _$_HomeEditAreaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComercialHours(bool newvalue) {
    final _$actionInfo = _$_HomeEditAreaViewModelBaseActionController
        .startAction(name: '_HomeEditAreaViewModelBase.setComercialHours');
    try {
      return super.setComercialHours(newvalue);
    } finally {
      _$_HomeEditAreaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUtilDays(bool newvalue) {
    final _$actionInfo = _$_HomeEditAreaViewModelBaseActionController
        .startAction(name: '_HomeEditAreaViewModelBase.setUtilDays');
    try {
      return super.setUtilDays(newvalue);
    } finally {
      _$_HomeEditAreaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCertificationToList(String newValue) {
    final _$actionInfo = _$_HomeEditAreaViewModelBaseActionController
        .startAction(name: '_HomeEditAreaViewModelBase.addCertificationToList');
    try {
      return super.addCertificationToList(newValue);
    } finally {
      _$_HomeEditAreaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCertificationToList(String value) {
    final _$actionInfo =
        _$_HomeEditAreaViewModelBaseActionController.startAction(
            name: '_HomeEditAreaViewModelBase.removeCertificationToList');
    try {
      return super.removeCertificationToList(value);
    } finally {
      _$_HomeEditAreaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isUtilDays: ${isUtilDays},
isComercialHours: ${isComercialHours},
valuCharged: ${valuCharged},
certificationList: ${certificationList},
workDaysList: ${workDaysList},
workHoursList: ${workHoursList}
    ''';
  }
}
