import 'package:ehelp/features/home/views/user_profile.view.dart';
import 'package:ehelp/features/login/views/landing.view.dart';
import 'package:ehelp/features/login/views/login.view.dart';
import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/models/user_type.dart';
import 'package:flutter/material.dart';

import '../features/booking/views/confirmation.view.dart';
import '../features/booking/views/step1.view.dart';
import '../features/booking/views/step3.view.dart';
import '../features/call_now/views/calling.view.dart';
import '../features/call_now/views/confirmation_call.view.dart';
import '../features/call_now/views/payment.view.dart';

typedef WidgetBuilderArgs = Widget Function(BuildContext context, Object args);

extension EhelpGeneratedRoutes on EhelpRoutes {
  static Map<String, WidgetBuilderArgs> get routes =>
      <String, WidgetBuilderArgs>{
        EhelpRoutes.landing: (context, args) => const LandingView(),
        EhelpRoutes.login: (context, args) => LoginView(
              userType: args as UserType,
            ),
        EhelpRoutes.homeClient: (context, args) => UserProfileView(),
        EhelpRoutes.clientBookingStep1: (context, args) => const Step1View(),
        EhelpRoutes.clientBookingStep2: (context, args) => const Step1View(),
        EhelpRoutes.clientBookingStep3: (context, args) => const Step3View(),
        EhelpRoutes.clientBookingConfirmation: (context, args) =>
            const ConfirmationView(),
        EhelpRoutes.clientCallNowPayment: (context, args) =>
            const PaymentView(),
        EhelpRoutes.clientCallNowCalling: (context, args) =>
            const CallingView(),
        EhelpRoutes.clientCallNowConfirmation: (context, args) =>
            const ConfirmationCallView()
      };

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final String? routerName = settings.name;
    final Object? routerArgs = settings.arguments ?? Object();

    final WidgetBuilderArgs? navigateTo = routes[routerName];
    if (navigateTo == null) {
      return null;
    }

    final Tween<Offset> position = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    );

    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          navigateTo.call(context, routerArgs!),
      transitionsBuilder: (BuildContext _, Animation<double> anim,
              Animation<double> __, Widget child) =>
          SlideTransition(
        position: position.animate(CurvedAnimation(
          parent: anim,
          curve: Curves.easeInOut,
        )),
        child: child,
      ),
    );
  }
}
