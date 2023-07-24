// ignore_for_file: one_member_abstracts

import 'package:ehelp/shared/entity/speciality.entity.dart';

import '../../../../../shared/entity/user/user.entity.dart';
import '../entity/home_client.entity.dart';
import '../entity/service_for_client.entity.dart';

abstract class HomeClientService {
  Future<HomeClientEntity> getHomeClient();
  Future<User> editProfile(final User newEditedUser);
  Future<List<ServiceForClientEntity>> getProvidersBySpecialities(
      final SpecialityEntity speciality);
}
