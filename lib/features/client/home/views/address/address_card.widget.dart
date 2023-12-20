import 'package:ehelp/features/client/home/model/entity/address_client.dart';
import 'package:ehelp/shared/fonts/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../routes/ehelp_routes.dart';
import '../../../../../shared/Colors/constants.dart';

class AddressClientCardWidget extends StatelessWidget {
  const AddressClientCardWidget(
      {required this.address,
      required this.onRemoveAddress,
      required this.isChile,
      super.key});
  final AdressClient address;
  final bool isChile;
  final Future<void> Function() onRemoveAddress;

  String _buildCompleteAddress(String cityName, String stateName) {
    return '${address.street}, Número ${address.number}, '
        '\n${address.additionalAddress}'
        '\n\n$cityName -  $stateName\n'
        '${address.countryName}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: -5,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      address.nickname,
                      style: FontStyles.size16Weight700,
                    ),
                    PopupMenuButton(
                      onSelected: (value) async {
                        if (value == 'edit') {
                          await Navigator.of(context).pushReplacementNamed(
                            EhelpRoutes.addressClient,
                            arguments: address.toJson(),
                          );
                        } else if (value == 'remove' &&
                            !address.isMainAddress) {
                          await onRemoveAddress.call();
                        }
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                        const PopupMenuItem(
                          value: 'edit',
                          child: Text('Editar'),
                        ),
                        if (!address.isMainAddress)
                          const PopupMenuItem(
                            value: 'remove',
                            child: Text('Excluir'),
                          ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  _buildCompleteAddress(
                      isChile ? address.comunaName : address.cityName,
                      isChile ? address.regionName : address.stateName),
                  style: FontStyles.size14Weight500grey,
                ),
                if (address.isMainAddress)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: ColorConstants.greenStrong,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Endereço principal',
                          style: FontStyles.size14Weight500,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
