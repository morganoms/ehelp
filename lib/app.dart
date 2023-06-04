import 'package:ehelp/routes/ehelp_generated_routes.dart';
import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/colors/constants.dart';
import 'package:ehelp/shared/config/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'shared/entity/user/user.entity.dart';

class EHelpApp extends StatelessWidget {
  const EHelpApp({this.userAuthenticated, Key? key}) : super(key: key);
  final User? userAuthenticated;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eHelp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color(0xFF575757),
          fontFamily: 'Lexend',
          dialogBackgroundColor: Colors.white,
          scaffoldBackgroundColor: ColorConstants.whiteBackground),
      initialRoute: userAuthenticated != null
          ? EhelpRoutes.homeClient
          : EhelpRoutes.landing,
      onGenerateRoute: EhelpGeneratedRoutes.generateRoute,
      supportedLocales: const <Locale>[Locale('pt', 'BR')],
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, widget) {
        return ScrollConfiguration(
            behavior: const CustomScrollBehavior(), child: widget as Widget);
      },
    );
  }
}
