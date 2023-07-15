// ignore_for_file: avoid_catching_errors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

import 'http/http_core_response.dart';

// ignore: avoid_classes_with_only_static_members
class LocalDataUtils {
  static Future<HttpCoreResponse> fetchLocalData(
      {required final int statusCode, required final String path}) async {
    HttpCoreResponse response;
    try {
      final String data =
          await rootBundle.loadString('packages/ehelp/assets/fixtures/$path');

      response = HttpCoreResponse(Response(data, statusCode));
    } on FlutterError {
      response = HttpCoreResponse(Response('Not Found', 404));
    }
    return response;
  }
}
