import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

import '../../locator.dart';
import '../../session/session.controller.dart';
import '../models/client_request_data.dart';

extension SendRequestStep on ClientRequestData {
  Future<Response> execute({
    required Client httpClient,
  }) async {
    Response result = await _sendRequest(httpClient);

    if (result.statusCode == 401) {
      final String newToken =
          await locator.get<SessionController>().refreshSession();
      headers!['Authorization'] = 'bearer $newToken';
      result = await _sendRequest(httpClient);
    }

    debugPrint('[http-client] request => ${toRequest()}');
    debugPrint('[http-client] statusCode => ${result.statusCode}');
    return result;
  }

  Future<Response> _sendRequest(Client httpClient) async {
    StreamedResponse response = StreamedResponse(
        Stream.value(
          List<int>.from(List.filled(1000000, 1)),
        ),
        200);
    await HttpOverrides.runWithHttpOverrides(() async {
      response = await httpClient.send(toRequest());
    }, IgnoreCertificateErrorOverrides());
    return Response.fromStream(response);
  }
}

class IgnoreCertificateErrorOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
