import 'package:ehelp/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  EHelpDependencies().setup();

  runApp(const EHelpApp());
}
