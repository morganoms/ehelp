import 'dart:convert';

import 'package:ehelp/core/http/http_core.dart';
import 'package:ehelp/features/login/models/datasource/login.datasource.dart';
import 'package:ehelp/features/login/models/entity/user.dto.dart';
import 'package:ehelp/features/login/models/entity/user.entity.dart';

import '../../../../core/http/http_core_error.dart';
import '../../../../core/http/http_core_response.dart';

class LoginRemoteDatasource extends LoginDatasource {
  LoginRemoteDatasource(this.client);
  final HttpCore client;

  @override
  Future<User> authenticate(final String email, final String password) async {
    try {
      final HttpCoreResponse response = await client.post(
        'login',
      );
      return UserDto.fromJson(json.decode(response.body));
    } on HttpCoreError catch (_) {
      rethrow;
    }
  }
}
