// ignore_for_file: only_throw_errors

import 'dart:developer';
import 'package:http/http.dart';
import '../models/client_response.dart';

extension HandleResponseStep on Response {
  Future<ClientResponse> toWillClientResponse() async {
    final int statusCode = this.statusCode;
    final ClientResponse result = ClientResponse(this);
    log('[http-client] response => $result');

    if (statusCode >= 200 && statusCode < 300) {
      return result;
    }

    throw result;
  }
}
