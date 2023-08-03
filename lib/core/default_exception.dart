import 'new_http/models/client_exception.dart';

final ClientException defaultException = ClientException(
  title: 'opa! não consegui mostrar as informações',
  message: 'Bora tentar de novo?\nRecarregue a página, por favor.',
  buttonFirst: 'Tentar de novo',
  errorCode: 0,
  statusCode: 0,
);

final ClientException unauthorizedException = ClientException(
  title: 'opa! Sua sessão expirou',
  message: 'Por favor, realize novamento o seu login.',
  buttonFirst: 'Fazer login',
  errorCode: 0,
  statusCode: 0,
);
