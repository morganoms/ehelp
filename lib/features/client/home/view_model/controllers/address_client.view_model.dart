import 'package:ehelp/core/new_http/models/client_response.dart';
import 'package:ehelp/features/client/home/model/entity/locality.entity.dart';
import 'package:ehelp/features/client/home/model/service/client_address/client_address.sevice.dart';
import 'package:mobx/mobx.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../core/new_http/models/client_exception.dart';

import '../../../../../shared/utils/mathod_handler.dart';
import '../../model/entity/address_client.dart';
import '../screen_state/address_client.scree_state.dart';
part 'address_client.view_model.g.dart';

class AdressClientViewModel = _AdressClientViewModelBase
    with _$AdressClientViewModel;

abstract class _AdressClientViewModelBase with Store {
  _AdressClientViewModelBase(this.service);

  final ClientAddressService service;

  ObservableList<AdressClient> addressList = <AdressClient>[].asObservable();

  ObservableList<LocalityEntity> countries = <LocalityEntity>[].asObservable();

  ObservableList<LocalityEntity> states = <LocalityEntity>[].asObservable();

  ObservableList<LocalityEntity> cities = <LocalityEntity>[].asObservable();

  @observable
  AddressClientScreenStatus state = AddressClientScreenStatus.loading();

  @observable
  AddressClientScreenStatus stateForm = AddressClientScreenStatus.loading();

  @action
  void addMainList(final List<AdressClient> newValue) {
    addressList
      ..clear()
      ..addAll(newValue);

    state = AddressClientScreenStatus.success();
  }

  @action
  Future<void> getAdresses(final int userId) async {
    state = AddressClientScreenStatus.loading();
    final Result<List<AdressClient>, ClientException> response =
        await MethodHandler.errorState<List<AdressClient>>(
            () => service.getHomeClient(userId));

    response.when(
      addMainList,
      (error) => state = AddressClientScreenStatus.error(error),
    );
  }

  @action
  Future<bool> editAddress(final AdressClient newAddress) async {
    bool result = false;
    state = AddressClientScreenStatus.loading();
    final Result<ClientResponse, ClientException> response =
        await MethodHandler.errorState<ClientResponse>(
            () => service.editAddress(newAddress));

    response.when(
      (success) => result = true,
      (error) => result = false,
    );
    state = AddressClientScreenStatus.success();

    return result;
  }

  @action
  Future<bool> newAddress(final AdressClient newAddress) async {
    bool result = false;
    state = AddressClientScreenStatus.loading();
    final Result<ClientResponse, ClientException> response =
        await MethodHandler.errorState<ClientResponse>(
            () => service.newAddress(newAddress));

    response.when(
      (success) => result = true,
      (error) => result = false,
    );
    state = AddressClientScreenStatus.success();

    return result;
  }

  @action
  Future<void> removeAddress(final int addressId, final int userId) async {
    state = AddressClientScreenStatus.loading();
    final Result<ClientResponse, ClientException> response =
        await MethodHandler.errorState<ClientResponse>(
            () => service.removeAddress(addressId));

    response.when(
      (success) async => getAdresses(userId),
      (error) => state = AddressClientScreenStatus.error(error),
    );
  }

  @action
  Future<void> getCountries() async {
    stateForm = AddressClientScreenStatus.loading();
    final Result<List<LocalityEntity>, ClientException> countryResponse =
        await MethodHandler.errorState<List<LocalityEntity>>(
            service.getCountries);

    countryResponse.when(
      (success) {
        countries
          ..clear()
          ..addAll(success);
        stateForm = AddressClientScreenStatus.success();
      },
      (error) => stateForm = AddressClientScreenStatus.error(error),
    );
  }

  @action
  Future<void> getStates(final int countryIdSelected) async {
    final Result<List<LocalityEntity>, ClientException> stateResponse =
        await MethodHandler.errorState<List<LocalityEntity>>(
            countryIdSelected == 2 ? service.getStates : service.getRegione);

    stateResponse.when(
      (success) {
        cities.clear();
        states
          ..clear()
          ..addAll(success);

        stateForm = AddressClientScreenStatus.success();
      },
      (error) => stateForm = AddressClientScreenStatus.error(error),
    );
  }

  @action
  Future<void> getCities(
      {required final bool isChile,
      final dynamic stateId,
      final dynamic regionId}) async {
    stateForm = AddressClientScreenStatus.loading();

    final Result<List<LocalityEntity>, ClientException> response =
        await MethodHandler.errorState<List<LocalityEntity>>(() => isChile
            ? service.getComuna(regionId as int)
            : service.getCities(stateId as int));

    response.when(
      (success) {
        cities
          ..clear()
          ..addAll(success);
        stateForm = AddressClientScreenStatus.success();
      },
      (error) => stateForm = AddressClientScreenStatus.error(error),
    );
  }
}
