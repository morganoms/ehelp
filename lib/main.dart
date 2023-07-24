import 'package:ehelp/app.dart';
import 'package:ehelp/core/session/session.controller.dart';
import 'package:ehelp/shared/entity/user/authenticate.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/locator.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  EHelpDependencies().setup();
  final Authenticate? session =
      await locator.get<SessionController>().getSessionFromDevice();
  FlutterNativeSplash.remove();
  runApp(EHelpApp(
    userAuthenticated: session?.userAuthenticated,
  ));
}
