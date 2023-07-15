import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenCoreServise {
  Future<void> saveToken(final String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', token);
    debugPrint('Token saved => $token');
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token != null) {
      debugPrint('Token retrived => $token');
      return token;
    } else {
      return null;
    }
  }
}
