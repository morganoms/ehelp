import 'dart:typed_data';

abstract class HttpResponse {
  Uint8List get bodyBytes;

  String get body;

  bool get isSuccess;

  bool get isFailure;

  int get statusCode;

  int? get contentLength;

  String? get title => null;

  String? get message => null;

  dynamic get extraData => null;

  String? get buttonFirst => null;
}
