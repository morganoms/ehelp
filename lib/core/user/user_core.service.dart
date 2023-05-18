import 'dart:convert';

import 'package:ehelp/features/login/models/entity/user.dto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/login/models/entity/user.entity.dart';

class UserCoreServise {
  Future<void> saveUser(final User userAuthenticated) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String user = jsonEncode(userAuthenticated.toJson());

    await prefs.setString('userAuthenticated', user);
    debugPrint('User saved => $user');
  }

  Future<User?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userAuthenticated = prefs.getString('userAuthenticated');
    if (userAuthenticated != null) {
      final User user = UserDto.fromJson(jsonDecode(userAuthenticated));
      debugPrint('User retrived => $user');
      return user;
    } else {
      return null;
    }
  }
}
