// ignore_for_file: avoid_catching_errors

import 'package:ehelp/core/new_http/models/client_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

// ignore: avoid_classes_with_only_static_members
class LocalDataUtils {
  static Future<ClientResponse> fetchLocalData(
      {required final int statusCode, required final String path}) async {
    ClientResponse response;
    try {
      final String data = await rootBundle.loadString('assets/fixtures/$path');

      response = ClientResponse(Response(data, statusCode));
    } on FlutterError {
      debugPrint('Fetch File Not Found');
      response = ClientResponse(Response('Not Found', 404));
    }
    return response;
  }
}
