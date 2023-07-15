import 'package:ehelp/app.dart';
import 'package:ehelp/core/token/token.controller.dart';
import 'package:ehelp/core/user/user.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/locator.dart';
import 'shared/entity/user/user.entity.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  EHelpDependencies().setup();
  final User? userAuthenticated =
      await locator.get<UserController>().getUserOnDevice();
  await locator.get<TokenController>().getTokenOnDevice();
  FlutterNativeSplash.remove();
  runApp(EHelpApp(
    userAuthenticated: userAuthenticated,
  ));
}
