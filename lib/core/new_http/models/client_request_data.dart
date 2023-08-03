import 'dart:convert';

import 'package:ehelp/core/new_http/models/client_methods.dart';
import 'package:http/http.dart';

class ClientRequestData {
  ClientRequestData({
    this.path,
    this.uri,
    this.method,
    this.query,
    this.headers,
    this.body,
    this.timeout,
  });

  final String? path;
  final ClientMethod? method;
  final Map<String, String>? query;
  final Object? body;
  final int? timeout;
  Uri? uri;
  Map<String, String>? headers;

  bool get isGet => method == ClientMethod.GET;

  @override
  String toString() {
    return 'RequestData('
        'path: $path, uri: $uri, method: ${method?.name}, '
        'headers: ${jsonEncode(headers)}, query: ${jsonEncode(query)}, '
        'body: ${jsonEncode(body)}, timeout: $timeout)';
  }

  BaseRequest toRequest() {
    return Request(
      method?.name ?? 'GET',
      uri ?? Uri.parse(path ?? ''),
    )
      ..headers.addAll(headers ?? {})
      ..body = jsonEncode(body);
  }
}
