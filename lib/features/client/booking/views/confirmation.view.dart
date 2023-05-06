import 'package:ehelp/shared/fonts/styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/back_button.widget.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/header_black.widget.dart';

class ConfirmationView extends StatelessWidget {
  const ConfirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          label: 'Voltar ao início',
          color: ColorConstants.greenDark,
          onPressed: () => Navigator.of(context)
              .popUntil(ModalRoute.withName('/home_client')),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderBlack(
              titleLable: 'Agendamento Finalizado',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset('assets/animations/check2.json',
                      repeat: false,
                      height: MediaQuery.of(context).size.height / 4),
                  Text(
                    'Você poderá acompanhar a confirmação do seu agendamento'
                    ' pelo profissional na aba de Atividade do seu aplicativo. '
                    '\n\nCaso o profissional não confirme em até 2 hrs antes da sua '
                    'data e hora selecionada, a solicitação expirará e você precisará '
                    'solicitar novamente.',
                    style: FontStyles.size18Weight400,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
