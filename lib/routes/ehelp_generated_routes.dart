import 'package:ehelp/features/home/views/home_client.view.dart';
import 'package:ehelp/features/home/views/user_profile.view.dart';
import 'package:ehelp/features/login/views/landing.view.dart';
import 'package:ehelp/features/login/views/login.view.dart';
import 'package:ehelp/features/professional/areas/views/home_areas.view.dart';
import 'package:ehelp/features/professional/areas/views/home_edit_area.view.dart';
import 'package:ehelp/features/professional/sign_in/views/adress_professional.view.dart';
import 'package:ehelp/features/professional/sign_in/views/banking_professional.view.dart';
import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/models/user_type.dart';
import 'package:flutter/material.dart';

import '../features/booking/views/confirmation.view.dart';
import '../features/booking/views/step1.view.dart';
import '../features/booking/views/step3.view.dart';
import '../features/call_now/views/calling.view.dart';
import '../features/call_now/views/confirmation_call.view.dart';
import '../features/call_now/views/payment.view.dart';
import '../features/professional/areas/views/certification_attach.view.dart';
import '../features/professional/areas/views/value_charged.view.dart';
import '../features/professional/areas/views/work_days.view.dart';
import '../features/professional/areas/views/work_hours.view.dart';
import '../features/professional/sign_in/views/personal_data.view.dart';

typedef WidgetBuilderArgs = Widget Function(BuildContext context, Object args);

extension EhelpGeneratedRoutes on EhelpRoutes {
  static Map<String, WidgetBuilderArgs> get routes =>
      <String, WidgetBuilderArgs>{
        EhelpRoutes.landing: (context, args) => const LandingView(),
        EhelpRoutes.login: (context, args) => LoginView(
              userType: args as UserType,
            ),
        EhelpRoutes.homeClient: (context, args) => const HomeClientView(),
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
            const ConfirmationCallView(),
        EhelpRoutes.personalData: (context, args) =>
            const ProfessionalPersonalDataView(),
        EhelpRoutes.addressProfessional: (context, args) =>
            const AdressProfessionalView(),
        EhelpRoutes.bankingProfessional: (context, args) =>
            const BankingProfessionalView(),
        EhelpRoutes.homeArea: (context, args) => const HomeAreaView(),
        EhelpRoutes.clientUserProfile: (context, args) => UserProfileView(),
        EhelpRoutes.certificationArea: (context, args) =>
            const CertificationAttachView(),
        EhelpRoutes.homeEditArea: (context, args) => const HomeEditAreaView(),
        EhelpRoutes.workDays: (context, args) => const WorkDaysView(),
        EhelpRoutes.workHours: (context, args) => const WorkHoursView(),
        EhelpRoutes.valueCharged: (context, args) => const ValueChargedView(),
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
