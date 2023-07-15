import 'dart:convert';

import 'package:ehelp/features/client/home/model/entity/home_client.entity.dart';
import 'package:ehelp/features/client/home/model/service/home_client.service.dart';

import '../../../../../core/http/http_core.dart';
import '../../../../../core/http/http_core_error.dart';
import '../../../../../core/http/http_core_response.dart';
import '../../../../../core/local_data_utils.dart';

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
}
