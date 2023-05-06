import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../shared/fonts/styles.dart';

class CallingProfessionalWidget extends StatelessWidget {
  const CallingProfessionalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Lottie.asset('assets/animations/calling2.json',
              height: MediaQuery.of(context).size.height / 5),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          'Aguarde a confirmação de donibilidade. Se confirmar, o profissional chegará em  até 2 horas.',
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
