import 'package:ehelp/core/locator.dart';
import 'package:ehelp/core/session/session.controller.dart';
import 'package:ehelp/shared/components/generic_button.widget.dart';
import 'package:flutter/material.dart';

import '../../core/http/http_core_error.dart';
import '../../routes/ehelp_routes.dart';

class GenericError extends StatelessWidget {
  GenericError({required this.requestError, Key? key}) : super(key: key);

  final HttpCoreError requestError;
  final SessionController _sessionController = locator.get<SessionController>();

  void onActionButtonClick(BuildContext context) {
    if (requestError.actionType?.isLogin ?? false) {
      _sessionController.removeSessionFromDevice().then((value) =>
          Navigator.of(context)
              .popUntil(ModalRoute.withName(EhelpRoutes.landing)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 48, right: 16),
          child: GenericButton(
              label: requestError.buttonFirst ?? 'Sair',
              onPressed: () => onActionButtonClick(context)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                'assets/images/expirado.png',
                height: MediaQuery.of(context).size.height / 5,
              )),
              const SizedBox(height: 16),
              Text(
                requestError.title ?? '',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(requestError.message ?? '')
            ],
          ),
        ));
  }
}
