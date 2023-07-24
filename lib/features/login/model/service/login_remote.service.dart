import 'dart:convert';

import 'package:ehelp/core/http/http_core.dart';
import 'package:ehelp/core/http/http_core_error.dart';
import 'package:ehelp/features/login/model/service/login.service.dart';
import 'package:ehelp/shared/entity/user/user.dto.dart';

import '../../../../core/http/http_core_response.dart';
import '../../../../shared/entity/user/authenticate.entity.dart';

class LoginRemoteService extends LoginService {
  LoginRemoteService(this.client);
  final HttpCore client;

  @override
  Future<Authenticate> authenticate(
      final String username, final String password) async {
    try {
      final HttpCoreResponse response = await client.post(
        'login',
        body: jsonEncode(
          <String, dynamic>{
            'username': username,
            'password': password,
          },
        ),
      );
      final Map<String, dynamic> responseDescoded = json.decode(response.body);

      return Authenticate(
        userAuthenticated: UserDto.fromJson(responseDescoded['user']),
        token: responseDescoded['token'],
        refreshToken: responseDescoded['refreshToken'],
      );
    } on HttpCoreError catch (_) {
      rethrow;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
