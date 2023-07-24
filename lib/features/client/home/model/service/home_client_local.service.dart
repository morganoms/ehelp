import 'dart:convert';

import 'package:ehelp/features/client/home/model/entity/home_client.entity.dart';
import 'package:ehelp/features/client/home/model/service/home_client.service.dart';
import 'package:ehelp/shared/entity/speciality.entity.dart';

import '../../../../../core/dto_validations.dart';
import '../../../../../core/http/http_core.dart';
import '../../../../../core/http/http_core_response.dart';

import '../../../../../shared/entity/user/user.dto.dart';
import '../../../../../shared/entity/user/user.entity.dart';
import '../entity/service_for_client.entity.dart';

class HomeClientLocalService extends HomeClientService {
  HomeClientLocalService(this.client);
  final HttpCore client;

  @override
  Future<HomeClientEntity> getHomeClient() async {
    final HttpCoreResponse response = await client.get(
      'customerDashboard/3',
    );

    return HomeClientDto.fromJson(json.decode(response.body));
  }

  @override
  Future<List<ServiceForClientEntity>> getProvidersBySpecialities(
      SpecialityEntity speciality) async {
    final HttpCoreResponse response = await client.get(
      'findUserSpecialtyDetail/${speciality.id}',
    );

    return DtoValidation.dynamicToListObject(
        json.decode(response.body), ServiceForClientDto.fromJson);
  }

  @override
  Future<User> editProfile(final User newEditedUser) async {
    final HttpCoreResponse response = await client.put(
      'update',
      body: jsonEncode(newEditedUser.toJson()),
    );

    return UserDto.fromJson(json.decode(response.body));
  }
}
