import 'package:ehelp/features/client/home/view_model/controllers/address_client.view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../shared/components/input.widget.dart';
import '../../../../../shared/components/input_dropdown.widget.dart';
import '../../../../../shared/utils/validators.dart';
import '../../../../client/home/model/entity/address_client.dart';
import '../../model/entity/locality.entity.dart';

class FormAddressWidget extends StatelessWidget {
  const FormAddressWidget(
      {required this.formKey,
      required this.addressFormValue,
      required this.viewModel,
      this.isEditing = false,
      this.address,
      Key? key})
      : super(key: key);
  final bool isEditing;

  final AdressClient? address;
  final GlobalKey<FormState> formKey;
  final Map<String, dynamic> addressFormValue;
  final AdressClientViewModel viewModel;

  Future<void> onCountryChange(dynamic countryId) async {
    addressFormValue['countryId'] = countryId;
    addressFormValue['isChile'] = countryId == 1;
    addressFormValue['stateId'] = null;
    addressFormValue['cityId'] = null;
    addressFormValue['regionId'] = null;
    addressFormValue['comunaId'] = null;
    await viewModel.getStates(countryId);
  }

  Future<void> onStateChange(dynamic id) async {
    addressFormValue['isChile']
        ? addressFormValue['regionId'] = id
        : addressFormValue['stateId'] = id;

    addressFormValue['cityId'] = null;
    addressFormValue['comunaId'] = null;
    await viewModel.getCities(
        isChile: addressFormValue['isChile'],
        regionId: addressFormValue['regionId'],
        stateId: addressFormValue['stateId']);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Observer(builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Input(
                  label: const Text('Apelido'),
                  validator: Validators.emptyValidate,
                  onChanged: (nickname) =>
                      addressFormValue['nickname'] = nickname,
                  initialValue: addressFormValue['nickname']),
              const SizedBox(height: 16),
              Input(
                  label: const Text('CEP/ZipCode'),
                  validator: Validators.emptyValidate,
                  onChanged: (zipcode) => addressFormValue['zipcode'] = zipcode,
                  initialValue: addressFormValue['zipcode']),
              const SizedBox(height: 16),
              Input(
                  label: const Text('Endereço'),
                  validator: Validators.emptyValidate,
                  onChanged: (street) => addressFormValue['street'] = street,
                  initialValue: addressFormValue['street']),
              const SizedBox(height: 16),
              Input(
                  label: const Text('Número'),
                  validator: Validators.emptyValidate,
                  onChanged: (number) => addressFormValue['number'] = number,
                  initialValue: addressFormValue['number']),
              const SizedBox(height: 16),
              Input(
                  label: const Text('Complemento'),
                  onChanged: (additionalAddress) =>
                      addressFormValue['additionalAddress'] = additionalAddress,
                  initialValue: addressFormValue['additionalAddress']),
              const SizedBox(height: 16),
              InputDropdown<int>(
                  value: addressFormValue['countryId'],
                  validator: Validators.emptyValidate,
                  items: viewModel.countries.map((LocalityEntity item) {
                    return DropdownMenuItem<int>(
                      value: item.id,
                      child: Text(item.description),
                    );
                  }).toList(),
                  hintText: 'País',
                  onChanged: onCountryChange),
              const SizedBox(height: 16),
              if (viewModel.states.isNotEmpty)
                InputDropdown<int>(
                    validator: Validators.emptyValidate,
                    value: addressFormValue['isChile']
                        ? addressFormValue['regionId']
                        : addressFormValue['stateId'],
                    items: viewModel.states.map((LocalityEntity item) {
                      return DropdownMenuItem<int>(
                        value: item.id,
                        child: Text(item.description),
                      );
                    }).toList(),
                    hintText:
                        addressFormValue['isChile'] ? 'Regione' : 'Estado',
                    onChanged: onStateChange),
              const SizedBox(height: 16),
              if (viewModel.cities.isNotEmpty)
                InputDropdown<int>(
                  validator: Validators.emptyValidate,
                  value: addressFormValue['isChile']
                      ? addressFormValue['comunaId']
                      : addressFormValue['cityId'],
                  items: viewModel.cities.map((LocalityEntity item) {
                    return DropdownMenuItem<int>(
                      value: item.id,
                      child: Text(item.description),
                    );
                  }).toList(),
                  hintText: addressFormValue['isChile'] ? 'Comuna' : 'Cidade',
                  onChanged: (id) => addressFormValue['isChile']
                      ? addressFormValue['comunaId'] = id
                      : addressFormValue['cityId'] = id,
                ),
            ],
          );
        }));
  }
}
