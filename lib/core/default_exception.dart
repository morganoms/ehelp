import 'package:ehelp/core/http/http_core_error.dart';

final HttpCoreError defaultException = HttpCoreError(
  title: 'opa! não consegui mostrar as informações',
  message: 'Bora tentar de novo?\nRecarregue a página, por favor.',
  buttonFirst: 'Tentar de novo',
  errorCode: 0,
  statusCode: 0,
);
