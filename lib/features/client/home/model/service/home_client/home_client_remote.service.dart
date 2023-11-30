import 'package:ehelp/features/client/home/model/entity/home_client.entity.dart';
import 'package:ehelp/shared/entity/speciality.entity.dart';

import '../../../../../../core/dto_validations.dart';
import '../../../../../../core/new_http/http_client.dart';
import '../../../../../../core/new_http/models/client_response.dart';
import '../../../../../../shared/entity/user/user.dto.dart';
import '../../../../../../shared/entity/user/user.entity.dart';
import '../../entity/service_for_client.entity.dart';
import 'home_client.service.dart';

class HomeClientLocalService extends HomeClientService {
  HomeClientLocalService(this.client);
  final HttpCoreClient client;

  @override
  Future<HomeClientEntity> getHomeClient() async {
    final ClientResponse response = await client.get(
      'customerDashboard/3',
    );

    return HomeClientDto.fromJson(response.body);
  }

  @override
  Future<List<ServiceForClientEntity>> getProvidersBySpecialities(
      SpecialityEntity speciality) async {
    final ClientResponse response = await client.get(
      'findUserSpecialtyDetail/${speciality.id}',
    );

    return DtoValidation.dynamicToListObject(
        response.body?['data'], ServiceForClientDto.fromJson);
  }

  @override
  Future<User> editProfile(final User newEditedUser) async {
    final ClientResponse response = await client.put(
      'update',
      body: newEditedUser.toJson(),
    );

    return UserDto.fromJson(response.body);
  }
}
