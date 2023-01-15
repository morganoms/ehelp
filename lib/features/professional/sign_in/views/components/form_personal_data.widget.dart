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
          Input(hintText: 'Nome Completo'),
          SizedBox(
            height: 16,
          ),
          Input(hintText: 'CPF'),
          SizedBox(
            height: 16,
          ),
          Input(hintText: 'Data de Nascimento'),
          SizedBox(
            height: 16,
          ),
          Input(hintText: 'Telefone'),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
