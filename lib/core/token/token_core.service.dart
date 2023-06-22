import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenCoreServise {
  Future<void> saveToken(final String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', token);
    debugPrint('Token saved => $token');
  }
}
