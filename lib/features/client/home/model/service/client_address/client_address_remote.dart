import 'package:ehelp/core/new_http/models/client_response.dart';

import 'package:ehelp/features/client/home/model/entity/address_client.dart';
import 'package:ehelp/features/client/home/model/entity/locality.entity.dart';

import '../../../../../../core/dto_validations.dart';
import '../../../../../../core/new_http/http_client.dart';
import 'client_address.sevice.dart';

class ClientAddressServiceRemote extends ClientAddressService {
  ClientAddressServiceRemote(this.client);
  final HttpCoreClient client;

  @override
  Future<List<AdressClient>> getHomeClient(final int userId) async {
    final ClientResponse response = await client.get('findAllAddress/$userId');

    return DtoValidation.dynamicToListObject(
        response.body?['data'], AdressClientDto.fromJson);
  }

  @override
  Future<ClientResponse> newAddress(AdressClient newAddress) async =>
      client.post('addAddress', body: newAddress.toJson());

  @override
  Future<ClientResponse> editAddress(AdressClient newAddress) async =>
      client.put('updateAddress', body: newAddress.toJson());

  @override
  Future<ClientResponse> removeAddress(int addressId) async =>
      client.delete('deleteAddress/$addressId');

  @override
  Future<List<LocalityEntity>> getCountries() async {
    final ClientResponse response = await client.get('findAllCountry');

    return DtoValidation.dynamicToListObject(
        response.body?['data'], LocalityEntityDto.fromJson);
  }

  @override
  Future<List<LocalityEntity>> getStates() async {
    final ClientResponse response = await client.get('findAllState');

    return DtoValidation.dynamicToListObject(
        response.body?['data'], LocalityEntityDto.fromJson);
  }

  @override
  Future<List<LocalityEntity>> getCities(int stateId) async {
    final ClientResponse response =
        await client.get('findAllCitySelect/$stateId');

    return DtoValidation.dynamicToListObject(
        response.body?['data'], LocalityEntityDto.fromJson);
  }

  @override
  Future<List<LocalityEntity>> getComuna(int regionId) async {
    final ClientResponse response =
        await client.get('findAllComunaSelect/$regionId');

    return DtoValidation.dynamicToListObject(
        response.body?['data'], LocalityEntityDto.fromJson);
  }

  @override
  Future<List<LocalityEntity>> getRegione() async {
    final ClientResponse response = await client.get('findAllRegione');

    return DtoValidation.dynamicToListObject(
        response.body?['data'], LocalityEntityDto.fromJson);
  }
}
