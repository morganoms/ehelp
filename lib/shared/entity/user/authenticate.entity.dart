import 'package:ehelp/shared/entity/user/user.entity.dart';

class Authenticate {
  Authenticate({
    required this.userAutenticated,
    required this.token,
  });
  final User userAutenticated;
  final String token;

  Map<String, dynamic> toJason() {
    return <String, dynamic>{
      'userAutenticated': userAutenticated.toJson(),
      'token': token,
    };
  }
}
