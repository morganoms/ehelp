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
    final StreamedResponse response = await httpClient.send(toRequest());
    return Response.fromStream(response);
  }
}
