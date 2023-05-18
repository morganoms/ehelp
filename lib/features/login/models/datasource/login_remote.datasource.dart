import 'dart:convert';

import 'package:ehelp/core/http/http_core.dart';
import 'package:ehelp/core/http/http_core_error.dart';
import 'package:ehelp/features/login/models/datasource/login.datasource.dart';
import 'package:ehelp/features/login/models/entity/user.dto.dart';
import 'package:ehelp/features/login/models/entity/user.entity.dart';

import '../../../../core/http/http_core_response.dart';
import '../../../../core/user/user_core.service.dart';

class LoginRemoteDatasource extends LoginDatasource {
  LoginRemoteDatasource(this.client);
  final HttpCore client;
  final UserCoreServise userService = UserCoreServise();

  @override
  Future<User> authenticate(
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
      final User userAuthenticated =
          UserDto.fromJson(json.decode(response.body)['user']);
      await userService.saveUser(userAuthenticated);

      return userAuthenticated;
    } on HttpCoreError catch (e) {
      rethrow;
    } on Exception catch (e) {
      rethrow;
    }
  }
}
