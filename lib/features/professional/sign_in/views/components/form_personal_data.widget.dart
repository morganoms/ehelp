import 'package:flutter/material.dart';

import '../../../../../shared/components/input.widget.dart';
import '../../../../../shared/entity/user/user.entity.dart';

class FormPersonalDataWidget extends StatelessWidget {
  const FormPersonalDataWidget(
      {required this.formKey,
      required this.userFormValue,
      this.isEditing = false,
      this.userAuthenticated,
      Key? key})
      : super(key: key);
  final bool isEditing;

  final User? userAuthenticated;
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic> userFormValue;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Input(
              label: const Text('Nome Completo'),
              onSaved: (name) => userFormValue['name'] = name,
              initialValue: isEditing ? userAuthenticated!.name : null),
          const SizedBox(
            height: 16,
          ),
          Input(
              label: const Text('Documento'),
              onSaved: (documentNumber) =>
                  userFormValue['documentNumber'] = documentNumber,
              initialValue:
                  isEditing ? userAuthenticated!.documentNumber : null),
          const SizedBox(
            height: 16,
          ),
          Input(
              label: const Text('Telefone'),
              onSaved: (phone) => userFormValue['phone'] = phone,
              initialValue: isEditing ? userAuthenticated!.phone : null),
          // const SizedBox(
          //   height: 16,
          // ),
          // Input(
          //     label: const Text('Telefone'),
          //     initialValue: isEditing ? '(81) 99521-0087' : null),
          // const SizedBox(
          //   height: 16,
          // ),
          // Input(
          //     label: const Text('Gênero'),
          //     initialValue: isEditing ? 'Masculino' : null),
          // const SizedBox(
          //   height: 16,
          // ),
        ],
      ),
    );
  }
}
