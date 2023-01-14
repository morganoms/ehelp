import 'package:ehelp/features/booking/views/confirmation.view.dart';
import 'package:ehelp/features/booking/views/step1.view.dart';
import 'package:ehelp/features/call_now/views/calling.view.dart';
import 'package:ehelp/features/call_now/views/payment.view.dart';
import 'package:ehelp/features/home/views/user_profile.view.dart';
import 'package:ehelp/features/login/views/landing.view.dart';
import 'package:ehelp/features/login/views/login.view.dart';
import 'package:ehelp/routes/ehelp_generated_routes.dart';
import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/booking/views/step2.view.dart';
import 'features/booking/views/step3.view.dart';
import 'features/call_now/views/confirmation_call.view.dart';
import 'features/home/views/home_client.view.dart';

class EHelpApp extends StatelessWidget {
  const EHelpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eHelp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF575757),
        fontFamily: 'Montserrat',
        dialogBackgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: EhelpRoutes.landing,
      onGenerateRoute: EhelpGeneratedRoutes.generateRoute,
      supportedLocales: const <Locale>[Locale('pt', 'BR')],
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
