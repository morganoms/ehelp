import 'package:flutter/material.dart';

import '../../../../../shared/fonts/styles.dart';

class ArrivedProfessionalWidget extends StatelessWidget {
  const ArrivedProfessionalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Profissional Chegou ao endereço',
          style: FontStyles.size20Weight700green,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          'Por favor, confirme a presença do profissional  em seu endereço.',
          style: FontStyles.size16Weight400,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
