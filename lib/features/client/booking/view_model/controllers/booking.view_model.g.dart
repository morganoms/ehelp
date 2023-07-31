// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookingViewModel on _BookingViewModelBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_BookingViewModelBase.isLoading'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_BookingViewModelBase.hasError'))
          .value;
  Computed<bool>? _$isSuccessComputed;

  @override
  bool get isSuccess =>
      (_$isSuccessComputed ??= Computed<bool>(() => super.isSuccess,
              name: '_BookingViewModelBase.isSuccess'))
          .value;

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

  late final _$mainEntityAtom =
      Atom(name: '_BookingViewModelBase.mainEntity', context: context);

  @override
  Booking get mainEntity {
    _$mainEntityAtom.reportRead();
    return super.mainEntity;
  }

  @override
  set mainEntity(Booking value) {
    _$mainEntityAtom.reportWrite(value, super.mainEntity, () {
      super.mainEntity = value;
    });
  }

  late final _$activeStepAtom =
      Atom(name: '_BookingViewModelBase.activeStep', context: context);

  @override
  BookingSteps get activeStep {
    _$activeStepAtom.reportRead();
    return super.activeStep;
  }

  @override
  set activeStep(BookingSteps value) {
    _$activeStepAtom.reportWrite(value, super.activeStep, () {
      super.activeStep = value;
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

  late final _$step1StateAtom =
      Atom(name: '_BookingViewModelBase.step1State', context: context);

  @override
  BookingClientScreenStatus get step1State {
    _$step1StateAtom.reportRead();
    return super.step1State;
  }

  @override
  set step1State(BookingClientScreenStatus value) {
    _$step1StateAtom.reportWrite(value, super.step1State, () {
      super.step1State = value;
    });
  }

  late final _$step2StateAtom =
      Atom(name: '_BookingViewModelBase.step2State', context: context);

  @override
  BookingClientScreenStatus get step2State {
    _$step2StateAtom.reportRead();
    return super.step2State;
  }

  @override
  set step2State(BookingClientScreenStatus value) {
    _$step2StateAtom.reportWrite(value, super.step2State, () {
      super.step2State = value;
    });
  }

  late final _$getWorkDaysAsyncAction =
      AsyncAction('_BookingViewModelBase.getWorkDays', context: context);

  @override
  Future<void> getWorkDays(int providerId) {
    return _$getWorkDaysAsyncAction.run(() => super.getWorkDays(providerId));
  }

  late final _$getWorkHoursAsyncAction =
      AsyncAction('_BookingViewModelBase.getWorkHours', context: context);

  @override
  Future<void> getWorkHours(int providerId) {
    return _$getWorkHoursAsyncAction.run(() => super.getWorkHours(providerId));
  }

  late final _$_BookingViewModelBaseActionController =
      ActionController(name: '_BookingViewModelBase', context: context);

  @override
  Booking setMainEntity(DateTime? newDay, int? newHour) {
    final _$actionInfo = _$_BookingViewModelBaseActionController.startAction(
        name: '_BookingViewModelBase.setMainEntity');
    try {
      return super.setMainEntity(newDay, newHour);
    } finally {
      _$_BookingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  BookingSteps setactiveStep(BookingSteps newBookingStep) {
    final _$actionInfo = _$_BookingViewModelBaseActionController.startAction(
        name: '_BookingViewModelBase.setactiveStep');
    try {
      return super.setactiveStep(newBookingStep);
    } finally {
      _$_BookingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void setComercialHours(bool newValue) {
    final _$actionInfo = _$_BookingViewModelBaseActionController.startAction(
        name: '_BookingViewModelBase.setComercialHours');
    try {
      return super.setComercialHours(newValue);
    } finally {
      _$_BookingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isComercialHours: ${isComercialHours},
mainEntity: ${mainEntity},
activeStep: ${activeStep},
workHoursList: ${workHoursList},
step1State: ${step1State},
step2State: ${step2State},
isLoading: ${isLoading},
hasError: ${hasError},
isSuccess: ${isSuccess}
    ''';
  }
}
