import 'package:ehelp/shared/colors/constants.dart';
import 'package:ehelp/shared/components/generic_button.widget.dart';
import 'package:flutter/material.dart';

import '../../core/locator.dart';
import '../../core/new_http/models/client_exception.dart';
import '../../core/session/session.controller.dart';
import '../../routes/ehelp_routes.dart';

class GenericError extends StatelessWidget {
  GenericError({required this.requestError, Key? key, this.onActionButtonClick})
      : super(key: key);

  final ClientException requestError;
  final void Function()? onActionButtonClick;

  final SessionController _sessionController = locator.get<SessionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 48, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GenericButton(
                  label: requestError.buttonFirst ?? 'Tentar novamente',
                  onPressed:
                      onActionButtonClick ?? () => Navigator.of(context).pop()),
              const SizedBox(height: 16),
              GenericButton(
                  label: 'Encerrar sessão',
                  color: Colors.white,
                  borderColor: ColorConstants.primaryColor,
                  labelStyle: const TextStyle(
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.w700),
                  onPressed: () {
                    _sessionController.removeSessionFromDevice().then((value) =>
                        Navigator.of(context).popUntil(
                            ModalRoute.withName(EhelpRoutes.landing)));
                  }),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                'assets/images/errado.png',
                height: MediaQuery.of(context).size.height / 5,
              )),
              const SizedBox(height: 16),
              Text(
                requestError.title ?? 'Ops! Algo deu errado.',
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
