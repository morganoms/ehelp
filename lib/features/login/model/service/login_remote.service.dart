import 'package:ehelp/core/new_http/http_client.dart';
import 'package:ehelp/features/login/model/service/login.service.dart';
import 'package:ehelp/shared/entity/user/user.dto.dart';

import '../../../../core/new_http/models/client_exception.dart';
import '../../../../core/new_http/models/client_response.dart';
import '../../../../shared/entity/user/authenticate.entity.dart';

class LoginRemoteService extends LoginService {
  LoginRemoteService(this.client);
  final HttpCoreClient client;

  @override
  Future<Authenticate> authenticate(
      final String username, final String password) async {
    try {
      final ClientResponse response = await client.post(
        'login',
        body: <String, dynamic>{
          'username': username,
          'password': password,
        },
      );

      return Authenticate(
        userAuthenticated: UserDto.fromJson(response.body?['user']),
        token: response.body?['token'] ?? '',
        refreshToken: response.body?['refreshToken'] ?? '',
      );
    } on ClientException catch (_) {
      rethrow;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
