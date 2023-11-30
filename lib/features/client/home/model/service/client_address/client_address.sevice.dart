import 'package:ehelp/core/new_http/models/client_response.dart';
import 'package:ehelp/features/client/home/model/entity/address_client.dart';
import 'package:ehelp/features/client/home/model/entity/locality.entity.dart';

abstract class ClientAddressService {
  Future<List<AdressClient>> getHomeClient(final int userId);
  Future<ClientResponse> newAddress(final AdressClient newAddress);
  Future<ClientResponse> editAddress(final AdressClient newAddress);
  Future<ClientResponse> removeAddress(final int addressId);
  Future<List<LocalityEntity>> getCountries();
  Future<List<LocalityEntity>> getStates();
  Future<List<LocalityEntity>> getCities(final int stateId);
  Future<List<LocalityEntity>> getRegione();
  Future<List<LocalityEntity>> getComuna(final int regionId);
}
