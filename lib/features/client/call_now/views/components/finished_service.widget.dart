import 'package:flutter/material.dart';

import '../../../../../shared/fonts/styles.dart';

class FinishedServiceWidget extends StatelessWidget {
  const FinishedServiceWidget({
    this.hours = '00',
    this.minutes = '00',
    this.seconds = '00',
    Key? key,
  }) : super(key: key);

  final String hours;
  final String minutes;
  final String seconds;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Serviço Finalizado',
          style: FontStyles.size20Weight700green,
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          'Tempo total de serviço',
          style: FontStyles.size16Weight400,
        ),
        const SizedBox(
          height: 16,
        ),
        Text('$hours : $minutes : $seconds', style: FontStyles.size40Weight700),
        const SizedBox(
          height: 48,
        ),
        Text(
          'Valor a pagar',
          style: FontStyles.size16Weight400,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          r'R$ 50,00',
          style: FontStyles.size24Weight700,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
