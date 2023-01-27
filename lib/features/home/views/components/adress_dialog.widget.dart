import 'package:ehelp/shared/components/generic_button.widget.dart';
import 'package:ehelp/shared/components/input.widget.dart';
import 'package:flutter/material.dart';

import '../../../../shared/fonts/styles.dart';

class AdressDialogWidget extends StatefulWidget {
  const AdressDialogWidget({Key? key}) : super(key: key);

  @override
  State<AdressDialogWidget> createState() => _AdressDialogWidgetState();
}

class _AdressDialogWidgetState extends State<AdressDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Confirme o endereço em que deseja o serviço',
            style: FontStyles.size16Weight700,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                const Input(label: Text('CEP')),
                const SizedBox(
                  height: 16,
                ),
                const Input(label: Text('Endereço')),
                const SizedBox(
                  height: 16,
                ),
                const Input(label: Text('Número')),
                const SizedBox(
                  height: 16,
                ),
                const Input(label: Text('Complemento')),
                const SizedBox(
                  height: 16,
                ),
                const Input(label: Text('Bairro')),
                const SizedBox(
                  height: 16,
                ),
                const Input(label: Text('Estado')),
                const SizedBox(
                  height: 16,
                ),
                const Input(label: Text('Estado')),
                const SizedBox(
                  height: 36,
                ),
                GenericButton(
                  label: 'Continuar',
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
