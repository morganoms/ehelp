import 'package:ehelp/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  EHelpDependencies().setup();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(const EHelpApp());
}
