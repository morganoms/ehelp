import 'package:flutter/material.dart';

import '../../../../../shared/components/input.widget.dart';

class FormPersonalDataWidget extends StatelessWidget {
  FormPersonalDataWidget({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: const [
          Input(label: Text('Nome Completo')),
          SizedBox(
            height: 16,
          ),
          Input(label: Text('CPF')),
          SizedBox(
            height: 16,
          ),
          Input(label: Text('Data de Nascimento')),
          SizedBox(
            height: 16,
          ),
          Input(label: Text('Telefone')),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
