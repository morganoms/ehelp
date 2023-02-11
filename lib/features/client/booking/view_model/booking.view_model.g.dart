// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookingViewModel on _BookingViewModelBase, Store {
  late final _$isComercialHoursAtom =
      Atom(name: '_BookingViewModelBase.isComercialHours', context: context);

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

  late final _$workHoursListAtom =
      Atom(name: '_BookingViewModelBase.workHoursList', context: context);

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

  late final _$_BookingViewModelBaseActionController =
      ActionController(name: '_BookingViewModelBase', context: context);

  @override
  void setSelectionWorkHour(int index, bool value) {
    final _$actionInfo = _$_BookingViewModelBaseActionController.startAction(
        name: '_BookingViewModelBase.setSelectionWorkHour');
    try {
      return super.setSelectionWorkHour(index, value);
    } finally {
      _$_BookingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComercialHours(bool newvalue) {
    final _$actionInfo = _$_BookingViewModelBaseActionController.startAction(
        name: '_BookingViewModelBase.setComercialHours');
    try {
      return super.setComercialHours(newvalue);
    } finally {
      _$_BookingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isComercialHours: ${isComercialHours},
workHoursList: ${workHoursList}
    ''';
  }
}
