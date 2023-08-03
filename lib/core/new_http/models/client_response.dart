import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart';

class ClientResponse {
  ClientResponse(this.response);

  final Response response;

  Map<String, String>? get headers => response.headers;

  int? get statusCode => response.statusCode;

  int? get contentLength => response.contentLength;

  Uint8List? get bodyBytes => response.bodyBytes;

  String? get rawBody => response.body;

  Map<String, dynamic>? get body {
    try {
      final decodedBody = json.decode(bodyAsString ?? response.body);

      return isBodyAList
          ? <String, dynamic>{'data': decodedBody}
          : decodedBody as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  String? get bodyAsString {
    try {
      return utf8.decode(response.bodyBytes);
    } catch (e) {
      return null;
    }
  }

  bool get isBodyAList => bodyAsString?.indexOf('[') == 0;

  bool get isSuccess => statusCode! >= 200 && statusCode! < 300;

  bool get isFailure => !isSuccess;

  @override
  String toString() {
    return 'WillClientResponse('
        'statusCode: $statusCode, '
        'headers: ${jsonEncode(headers)}, '
        'body: ${jsonEncode(response.body)})';
  }
}
