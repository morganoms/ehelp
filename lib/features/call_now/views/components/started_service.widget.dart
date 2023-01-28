import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';

import '../../../../shared/fonts/styles.dart';

class StartedServiceWidget extends StatelessWidget {
  const StartedServiceWidget({
    required this.timeController,
    Key? key,
  }) : super(key: key);
  final CustomTimerController timeController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Serviço Iniciado',
          style: FontStyles.size20Weight700green,
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          'Tempo decorrido após o inicio do serviço',
          style: FontStyles.size16Weight400,
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTimer(
          controller: timeController,
          builder: (state, time) {
            return Text('${time.hours} : ${time.minutes} : ${time.seconds}',
                style: FontStyles.size40Weight700);
          },
        ),
        const SizedBox(
          height: 48,
        ),
        Text(
          'A forma de pagamento do serviço será calculada de acordo com o tempo gasto.',
          style: FontStyles.size16Weight400,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Por favor acompanhe o profissional durante  a execução do serviço',
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
