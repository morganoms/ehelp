import 'dart:convert';

import 'package:ehelp/core/new_http/models/client_response.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/entity/user/authenticate.entity.dart';
import '../new_http/http_client.dart';

class SessionCoreServise {
  SessionCoreServise(this.httpClient);

  final HttpCoreClient httpClient;

  Future<void> saveSession(final Authenticate session) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String sessionActive = jsonEncode(session.toJson());
    await removeSession();

    await prefs.setString('sessionActive', sessionActive);

    debugPrint('Session saved => $sessionActive');
  }

  Future<Authenticate?> getSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? sessionActive = prefs.getString('sessionActive');
    if (sessionActive != null) {
      final Authenticate session =
          AuthenticateDto.fromJson(jsonDecode(sessionActive));

      debugPrint('User retrived => ${session.userAuthenticated.toString()}');
      debugPrint('Token retrived => ${session.token}');
      return session;
    } else {
      return null;
    }
  }

  Future<bool> removeSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool result = await prefs.remove('sessionActive');
    debugPrint('Session was removed ');
    return result;
  }

  Future<String> refreshToken(final String refreshToken) async {
    try {
      final ClientResponse response = await httpClient.post(
        'refreshToken',
        body: jsonEncode(
          <String, dynamic>{'refresh_token': refreshToken},
        ),
      );
      debugPrint('Session was refreshed');
      final Authenticate? oldSession = await getSession();
      await saveSession(Authenticate(
          userAuthenticated: oldSession!.userAuthenticated,
          token: response.body?['token'],
          refreshToken: response.body?['refreshToken']));
      return response.body?['token'];
    } on HttpCoreClient catch (_) {
      rethrow;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
