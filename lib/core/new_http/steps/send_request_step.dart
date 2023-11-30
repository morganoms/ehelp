// ignore_for_file: unnecessary_await_in_return

import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../locator.dart';
import '../../session/session.controller.dart';
import '../models/client_request_data.dart';

enum HttpCommand {
  get,
  post,
  put,
  patch,
  delete,
}

extension StringToHttpCommand on String {
  HttpCommand convertToHttpCommand() {
    switch (toUpperCase()) {
      case 'GET':
        return HttpCommand.get;
      case 'POST':
        return HttpCommand.post;
      case 'PUT':
        return HttpCommand.put;
      case 'PATCH':
        return HttpCommand.patch;
      case 'DELETE':
        return HttpCommand.delete;
      default:
        throw Exception();
    }
  }
}

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

  Future<Response> _sendRequest(
    Client httpClient,
  ) async {
    final BaseRequest baseRequest = toRequest();

    final httpCommand = (method?.name ?? 'GET').convertToHttpCommand();

    switch (httpCommand) {
      case HttpCommand.get:
        return await http
            .get(
              baseRequest.url,
              headers: baseRequest.headers,
            )
            .timeout(Duration(seconds: timeout ?? 60));
      case HttpCommand.post:
        return await http
            .post(
              baseRequest.url,
              headers: baseRequest.headers,
              body: jsonEncode(body ?? {}),
            )
            .timeout(Duration(seconds: timeout ?? 60));
      case HttpCommand.put:
        return await http
            .put(
              baseRequest.url,
              headers: baseRequest.headers,
              body: body,
            )
            .timeout(Duration(seconds: timeout ?? 60));
      case HttpCommand.patch:
        return await http
            .patch(
              baseRequest.url,
              headers: baseRequest.headers,
              body: body,
            )
            .timeout(Duration(seconds: timeout ?? 60));
      case HttpCommand.delete:
        return await http
            .delete(
              baseRequest.url,
              headers: baseRequest.headers,
              body: body,
            )
            .timeout(Duration(seconds: timeout ?? 60));
      default:
        throw Exception('Método http não implementado');
    }
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
