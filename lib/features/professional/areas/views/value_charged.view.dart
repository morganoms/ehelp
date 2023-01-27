import 'package:flutter/material.dart';

import '../../../../shared/components/input.widget.dart';
import '../../../../shared/fonts/styles.dart';

class ValueChargedView extends StatelessWidget {
  const ValueChargedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Observação',
              style: FontStyles.size16Weight700,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
                'Antes de preencher o valor cobrado, lembre que a plataforma cobrará uma taxa de 20% em relação a valor informado. '),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 18,
                      ),
                    ),
                  ),
                  Text(
                    'Valor Cobrado',
                    style: FontStyles.size16Weight700,
                  )
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              const Input(hintText: 'Valor que deseja cobrar'),
            ],
          ),
        ),
      ),
    );
  }
}
