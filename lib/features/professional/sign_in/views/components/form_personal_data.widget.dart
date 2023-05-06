import 'package:flutter/material.dart';

import '../../../../../shared/components/input.widget.dart';

class FormPersonalDataWidget extends StatelessWidget {
  FormPersonalDataWidget({this.isEditing = false, Key? key}) : super(key: key);
  final bool isEditing;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Input(
              label: const Text('Nome Completo'),
              initialValue:
                  isEditing ? 'Morgan Oliveira Melo de Siqueira' : null),
          const SizedBox(
            height: 16,
          ),
          Input(
              label: const Text('CPF'),
              initialValue: isEditing ? '121.099.864-50' : null),
          const SizedBox(
            height: 16,
          ),
          Input(
              label: const Text('Data de Nascimento'),
              initialValue: isEditing ? '22/01/1998' : null),
          const SizedBox(
            height: 16,
          ),
          Input(
              label: const Text('Telefone'),
              initialValue: isEditing ? '(81) 99521-0087' : null),
          const SizedBox(
            height: 16,
          ),
          Input(
              label: const Text('Gênero'),
              initialValue: isEditing ? 'Masculino' : null),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
