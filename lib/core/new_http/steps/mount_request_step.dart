import 'dart:developer';

import 'package:flutter_credit_card/extension.dart';

import '../../locator.dart';
import '../../session/session.controller.dart';
import '../models/client_request_data.dart';

String minVersionKey =
    '38c8918c-cf60-4c86-bf61-571e7eb8090bb39dcde1-9e6e-4298-8938-bbc49010524d';

extension MountRequestStep on ClientRequestData {
  Future<ClientRequestData> toWillRequest() async {
    final String? accessToken =
        locator.get<SessionController>().session?.token ?? '';

    final bool useAccessToken = !path!.contains('refreshToken');

    final Uri uri = await _mountUri(path: path!, query: query);

    final Map<String, String> headers = await _mountHeader(
        requestData: this,
        accessToken: accessToken,
        showAcessToken: useAccessToken && accessToken.isNotNullAndNotEmpty);

    this.uri = uri;
    this.headers = headers;

    log('[http-client] mountedRequest => $this');
    return this;
  }

  Future<Uri> _mountUri({
    required final String path,
    required final Map<String, String>? query,
  }) async {
    const String baseUrl = 'https://api.ehelpresidencial.com/api/v1/auth/';
    return Uri.parse('$baseUrl$path').replace(
      queryParameters: query,
    );
  }

  Future<Map<String, String>> _mountHeader(
          {required ClientRequestData requestData,
          required final String? accessToken,
          final bool showAcessToken = true}) async =>
      {}
        ..addAll(requestData.headers ?? {})
        ..addAll(requestData.isGet ? {} : {'Content-Type': 'application/json'})
        ..addAll(
            showAcessToken ? {'Authorization': 'bearer $accessToken'} : {});
}
