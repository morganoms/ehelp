// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_client.view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdressClientViewModel on _AdressClientViewModelBase, Store {
  late final _$stateAtom =
      Atom(name: '_AdressClientViewModelBase.state', context: context);

  @override
  AddressClientScreenStatus get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(AddressClientScreenStatus value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$stateFormAtom =
      Atom(name: '_AdressClientViewModelBase.stateForm', context: context);

  @override
  AddressClientScreenStatus get stateForm {
    _$stateFormAtom.reportRead();
    return super.stateForm;
  }

  @override
  set stateForm(AddressClientScreenStatus value) {
    _$stateFormAtom.reportWrite(value, super.stateForm, () {
      super.stateForm = value;
    });
  }

  late final _$getAdressesAsyncAction =
      AsyncAction('_AdressClientViewModelBase.getAdresses', context: context);

  @override
  Future<void> getAdresses(int userId) {
    return _$getAdressesAsyncAction.run(() => super.getAdresses(userId));
  }

  late final _$editAddressAsyncAction =
      AsyncAction('_AdressClientViewModelBase.editAddress', context: context);

  @override
  Future<bool> editAddress(AdressClient newAddress) {
    return _$editAddressAsyncAction.run(() => super.editAddress(newAddress));
  }

  late final _$newAddressAsyncAction =
      AsyncAction('_AdressClientViewModelBase.newAddress', context: context);

  @override
  Future<bool> newAddress(AdressClient newAddress) {
    return _$newAddressAsyncAction.run(() => super.newAddress(newAddress));
  }

  late final _$removeAddressAsyncAction =
      AsyncAction('_AdressClientViewModelBase.removeAddress', context: context);

  @override
  Future<void> removeAddress(int addressId, int userId) {
    return _$removeAddressAsyncAction
        .run(() => super.removeAddress(addressId, userId));
  }

  late final _$getCountriesAsyncAction =
      AsyncAction('_AdressClientViewModelBase.getCountries', context: context);

  @override
  Future<void> getCountries() {
    return _$getCountriesAsyncAction.run(() => super.getCountries());
  }

  late final _$getStatesAsyncAction =
      AsyncAction('_AdressClientViewModelBase.getStates', context: context);

  @override
  Future<void> getStates(int countryIdSelected) {
    return _$getStatesAsyncAction.run(() => super.getStates(countryIdSelected));
  }

  late final _$getCitiesAsyncAction =
      AsyncAction('_AdressClientViewModelBase.getCities', context: context);

  @override
  Future<void> getCities(
      {required bool isChile, dynamic stateId, dynamic regionId}) {
    return _$getCitiesAsyncAction.run(() => super
        .getCities(isChile: isChile, stateId: stateId, regionId: regionId));
  }

  late final _$_AdressClientViewModelBaseActionController =
      ActionController(name: '_AdressClientViewModelBase', context: context);

  @override
  void addMainList(List<AdressClient> newValue) {
    final _$actionInfo = _$_AdressClientViewModelBaseActionController
        .startAction(name: '_AdressClientViewModelBase.addMainList');
    try {
      return super.addMainList(newValue);
    } finally {
      _$_AdressClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
stateForm: ${stateForm}
    ''';
  }
}
