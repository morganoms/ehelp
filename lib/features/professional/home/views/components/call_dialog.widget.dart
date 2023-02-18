import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/colors/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../shared/components/generic_button.widget.dart';
import '../../../../../shared/fonts/styles.dart';

class CallDialogWidget extends StatelessWidget {
  const CallDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Text(
            'Novo Chamado',
            style: FontStyles.size20Weight700,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          Lottie.asset('assets/animations/teste.json',
              repeat: true, height: MediaQuery.of(context).size.height / 4),
          const SizedBox(
            height: 24,
          ),
          const Text('Cliente'),
          Text(
            'Maria Almeida',
            style: FontStyles.size18Weight700,
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Problema de fio desencapado devido a acidente domestico. Preciso de concerto urgente.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          GenericButton(
            label: 'Ver Detalhes',
            color: ColorConstants.greenDark,
            onPressed: () => Navigator.of(context)
                .pushNamed(EhelpRoutes.callDetail)
                .then((value) => Navigator.of(context).pop()),
          )
        ],
      ),
    );
  }
}
