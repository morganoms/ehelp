// ignore_for_file: one_member_abstracts

import '../entity/home_client.entity.dart';

abstract class HomeClientService {
  Future<HomeClientEntity> getHomeClient();
}
