import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/entity/user/authenticate.entity.dart';
import '../http/http_core.dart';
import '../http/http_core_error.dart';
import '../http/http_core_response.dart';

class SessionCoreServise {
  SessionCoreServise(this.httpClient);

  final HttpCore httpClient;

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

  Future<void> refreshToken(final String refreshToken) async {
    try {
      final HttpCoreResponse response = await httpClient.post(
        'refreshToken',
        body: jsonEncode(
          <String, dynamic>{'refresh_token': refreshToken},
        ),
      );
      debugPrint('Session was refreshed');
      final Map<String, dynamic> responseDescoded = json.decode(response.body);
      final Authenticate? oldSession = await getSession();
      await saveSession(Authenticate(
          userAuthenticated: oldSession!.userAuthenticated,
          token: responseDescoded['token'],
          refreshToken: responseDescoded['refreshToken']));
    } on HttpCoreError catch (_) {
      rethrow;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
