import 'package:ehelp/core/http/http_core_error.dart';
import 'package:ehelp/core/http/http_response.dart';

final HttpCoreError defaultException = HttpCoreError(
  title: 'opa! não consegui mostrar as informações',
  message: 'Bora tentar de novo?\nRecarregue a página, por favor.',
  buttonFirst: 'Tentar de novo',
  actionType: ActionType.leave,
  errorCode: 0,
  statusCode: 0,
);

final HttpCoreError unauthorizedException = HttpCoreError(
  title: 'opa! Sua sessão expirou',
  message: 'Por favor, realize novamento o seu login.',
  buttonFirst: 'Fazer login',
  actionType: ActionType.login,
  errorCode: 0,
  statusCode: 0,
);
