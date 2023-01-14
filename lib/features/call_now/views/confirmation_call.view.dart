import 'package:flutter/material.dart';

import '../../../shared/components/generic_button.widget.dart';
import '../../../shared/fonts/styles.dart';
import '../../home/views/components/service_item.widget.dart';

class ConfirmationCallView extends StatelessWidget {
  const ConfirmationCallView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          label: 'Voltar ao início',
          onPressed: () => Navigator.of(context)
              .popUntil(ModalRoute.withName('/home_client')),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
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
                      'Chamar Agora',
                      style: FontStyles.size16Weight700,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                ServiceItemWidget(),
                const SizedBox(
                  height: 32,
                ),
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
            ),
          ),
        ),
      ),
    );
  }
}
