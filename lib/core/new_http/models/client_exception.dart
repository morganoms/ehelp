enum ClientErrorType { client, server, network, timeout, unknown, unauthorized }

class ClientException implements Exception {
  ClientException({
    this.type = ClientErrorType.unknown,
    this.title,
    this.message,
    this.errorCode,
    this.statusCode,
    this.image,
    this.buttonFirst,
    this.buttonAction,
  });

  final ClientErrorType type;
  String? title;
  String? message;
  int? errorCode;
  int? statusCode;
  String? image;
  String? buttonFirst;
  String? buttonAction;

  @override
  String toString() {
    return 'ClientException{title: $title, message: $message}';
  }
}
