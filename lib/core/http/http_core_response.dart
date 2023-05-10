import 'package:ehelp/core/http/http_response.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class HttpCoreResponse extends HttpResponse {
  HttpCoreResponse(this.response);

  final Response response;

  @override
  String get body => response.body;

  @override
  Uint8List get bodyBytes => response.bodyBytes;

  @override
  bool get isFailure => !isSuccess;

  @override
  bool get isSuccess => statusCode >= 200 && statusCode < 300;

  @override
  int get statusCode => response.statusCode;

  @override
  int? get contentLength => response.contentLength;
}
