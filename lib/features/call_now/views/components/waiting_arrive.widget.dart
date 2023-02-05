import 'package:flutter/material.dart';

import '../../../../shared/fonts/styles.dart';

class WaitingArriveWidget extends StatelessWidget {
  const WaitingArriveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Sua solicitação foi confirmada!',
          style: FontStyles.size20Weight700green,
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          'Tempo estimado para chgada',
          style: FontStyles.size16Weight400,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          '30 min',
          style: FontStyles.size16Weight700,
        ),
        const SizedBox(
          height: 48,
        ),
        Text(
          'Aguarde no endereço Informado',
          style: FontStyles.size16Weight700,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'O valor mínimo da visita é de 1 hora. Quando o profissional chegar um relógio começará a contar, se utilizar mais de 1 hora será cobrado proporcionalmente o tempo adicional utilizado.',
          style: FontStyles.size16Weight400,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
