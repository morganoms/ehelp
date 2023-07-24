import 'package:ehelp/shared/entity/user/user.dto.dart';
import 'package:ehelp/shared/entity/user/user.entity.dart';

class Authenticate {
  Authenticate(
      {required this.userAuthenticated,
      required this.token,
      required this.refreshToken});
  final User userAuthenticated;
  final String token;
  final String refreshToken;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userAuthenticated': userAuthenticated.toJson(),
      'token': token,
      'refreshToken': refreshToken,
    };
  }
}

extension AuthenticateDto on Authenticate {
  static Authenticate fromJson(final Map<String, dynamic> json) {
    return Authenticate(
        userAuthenticated: UserDto.fromJson(json['userAuthenticated']),
        token: json['token'],
        refreshToken: json['refreshToken']);
  }
}
