import 'package:flutter/material.dart';

import '../../../../../shared/components/input.widget.dart';
import '../../../../client/home/model/entity/address_client.dart';

class FormAddressWidget extends StatelessWidget {
  const FormAddressWidget(
      {required this.formKey,
      required this.addressFormValue,
      this.isEditing = false,
      this.address,
      Key? key})
      : super(key: key);
  final bool isEditing;

  final AdressClient? address;
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic> addressFormValue;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Input(
              label: const Text('Apelido'),
              onSaved: (nickname) => addressFormValue['nickname'] = nickname,
              initialValue: addressFormValue['nickname']),
          const SizedBox(height: 16),
          Input(
              label: const Text('CEP/ZipCode'),
              onSaved: (zipcode) => addressFormValue['zipcode'] = zipcode,
              initialValue: addressFormValue['zipcode']),
          const SizedBox(height: 16),
          Input(
              label: const Text('Endereço'),
              onSaved: (street) => addressFormValue['street'] = street,
              initialValue: addressFormValue['street']),
          const SizedBox(height: 16),
          Input(
              label: const Text('Número'),
              onSaved: (number) => addressFormValue['number'] = number,
              initialValue: addressFormValue['number']),
          const SizedBox(height: 16),
          Input(
              label: const Text('Complemento'),
              onSaved: (additionalAddress) =>
                  addressFormValue['additionalAddress'] = additionalAddress,
              initialValue: addressFormValue['additionalAddress']),
          const SizedBox(height: 16),
          Input(
              label: const Text('Cidade'),
              onSaved: (countryId) => addressFormValue['countryId'] = countryId,
              initialValue: addressFormValue['countryName']),
          const SizedBox(height: 16),
          Input(
              label: const Text('Estado'),
              onSaved: (stateId) => addressFormValue['satateId'] = stateId,
              initialValue: addressFormValue['stateName']),
          const SizedBox(height: 16),
          Input(
              label: const Text('País'),
              onSaved: (countryId) => addressFormValue['countryId'] = countryId,
              initialValue: addressFormValue['countryName']),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
