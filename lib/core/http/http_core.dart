import 'dart:convert';
import 'dart:developer';

import 'package:ehelp/core/http/http_core_error.dart';
import 'package:ehelp/core/http/http_response.dart';
import 'package:ehelp/core/http/http_unauthorized_error.dart';
import 'package:ehelp/core/locator.dart';
import 'package:ehelp/core/session/session.controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'http_core_response.dart';

enum HttpCommand {
  get,
  post,
  put,
  patch,
  delete,
}

class HttpCore {
  final String baseUrl = 'https://api.ehelpresidencial.com/api/v1/auth';
  Future<HttpCoreResponse> _genericRequest(
    HttpCommand httpCommand,
    String url, {
    Map<String, String>? headers,
    Object? body,
    bool? isRefreshRequest,
    int? timeout,
    Encoding? encoding,
    Map<String, String>? query,
  }) async {
    try {
      Response response = await _execRequest(
        httpCommand,
        url,
        headers: headers,
        body: body,
        isRefreshRequest: isRefreshRequest,
        encoding: encoding,
        timeout: timeout,
      );

      if (response.statusCode == 401) {
        await locator.get<SessionController>().refreshSession();
        response = await _execRequest(
          httpCommand,
          url,
          headers: headers,
          body: body,
          encoding: encoding,
          timeout: timeout,
        );
      }
      log('Request => ${response.request}');
      log('Response: (${response.statusCode}) => '
          '${response.body}');

      return await handleResponse(response);
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<dynamic> _execRequest(
    HttpCommand httpCommand,
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    bool? isRefreshRequest,
    int? timeout,
  }) async {
    try {
      final Uri sendUri = Uri.parse(url);
      final String token = getToken();
      final Map<String, String> defaultHeader = {
        'Content-Type': 'application/json',
      };
      if (!(isRefreshRequest ?? false)) {
        defaultHeader['Authorization'] = 'bearer $token';
      }

      switch (httpCommand) {
        case HttpCommand.get:
          return await http
              .get(
                sendUri,
                headers: defaultHeader,
              )
              .timeout(Duration(seconds: timeout ?? 60));
        case HttpCommand.post:
          return await http
              .post(sendUri,
                  body: body, encoding: encoding, headers: defaultHeader)
              .timeout(Duration(seconds: timeout ?? 60));
        case HttpCommand.put:
          return await http
              .put(sendUri, body: body, headers: defaultHeader)
              .timeout(Duration(seconds: timeout ?? 60));
        case HttpCommand.patch:
          return await http
              .patch(
                sendUri,
                body: body,
                headers: defaultHeader,
              )
              .timeout(Duration(seconds: timeout ?? 60));
        case HttpCommand.delete:
          return await http
              .delete(sendUri, body: body, headers: defaultHeader)
              .timeout(Duration(seconds: timeout ?? 60));
        default:
          throw Exception('Método http não implementado');
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<HttpCoreResponse> get(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? query,
    int? timeout = 60,
  }) async =>
      _genericRequest(
        HttpCommand.get,
        '$baseUrl/$url',
        headers: headers,
        timeout: timeout,
        query: query,
      );

  Future<HttpCoreResponse> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    bool isRefreshRequest = false,
    int? timeout,
  }) async =>
      _genericRequest(
        HttpCommand.post,
        '$baseUrl/$url',
        headers: headers,
        body: body,
        isRefreshRequest: isRefreshRequest,
        encoding: encoding,
        timeout: timeout,
      );

  Future<HttpCoreResponse> put(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    int? timeout,
  }) async =>
      _genericRequest(
        HttpCommand.put,
        '$baseUrl/$url',
        body: body,
        timeout: timeout,
      );

  Future<HttpCoreResponse> patch(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    int? timeout,
  }) async =>
      _genericRequest(
        HttpCommand.patch,
        '$baseUrl/$url',
        headers: headers,
        body: body,
        timeout: timeout,
      );

  Future<HttpCoreResponse> delete(
    String url, {
    Map<String, String>? headers,
    Object? body,
    int? timeout,
  }) async =>
      _genericRequest(
        HttpCommand.delete,
        '$baseUrl/$url',
        body: body,
        headers: headers,
        timeout: timeout,
      );

  String getToken() {
    final SessionController controller = locator.get<SessionController>();
    return controller.session?.token ?? '';
  }

  Future<HttpCoreResponse> handleResponse(Response response) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return HttpCoreResponse(response);
    } else if (response.statusCode == 401) {
      final Map<String, dynamic> data = json.decode(response.body);
      throw HttpUnauthorizedError(
          message: data['message'].toString(),
          title: data['title'] ?? '',
          buttonFirst: data['buttonFirst'] ?? '',
          statusCode: response.statusCode,
          actionType: ActionType.login,
          imagePath: 'expirado.png',
          body: '',
          errorCode: data['errorCode']);
    } else {
      final Map<String, dynamic> data = json.decode(response.body);
      throw HttpCoreError(
          message: data['message'].toString(),
          title: data['title'] ?? '',
          buttonFirst: data['buttonFirst'] ?? '',
          statusCode: response.statusCode,
          actionType: ActionType.retry,
          imagePath: 'chateado.png',
          body: '',
          errorCode: data['errorCode']);
    }
  }
}
