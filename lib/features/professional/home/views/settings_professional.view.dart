import 'package:ehelp/shared/fonts/styles.dart';
import 'package:flutter/material.dart';

import '../../../../shared/colors/constants.dart';

class SettingsProfesssionalView extends StatelessWidget {
  const SettingsProfesssionalView({Key? key}) : super(key: key);

  Widget _buildItemSetting({required String name, required IconData icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SizedBox(width: 16),
            Icon(
              icon,
              size: 32,
              color: ColorConstants.blueSelected,
            ),
            const SizedBox(width: 18),
            Text(
              name,
              style: FontStyles.size18Weight700,
            ),
          ],
        ),
        const Icon(
          Icons.arrow_forward_rounded,
          color: Color.fromARGB(255, 156, 155, 155),
        ),
      ],
    );
  }

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [ColorConstants.primaryV2, Colors.white],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Text(
                    'Configurações',
                    style: FontStyles.size20Weight400,
                  ),
                  const SizedBox(height: 48),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Conta', style: FontStyles.size18Weight400),
                  ),
                  const SizedBox(height: 32),
                  _buildItemSetting(
                      icon: Icons.person_2_outlined, name: 'Perfil'),
                  const SizedBox(height: 32),
                  _buildItemSetting(
                      icon: Icons.location_on_outlined, name: 'Endereços'),
                  const SizedBox(height: 32),
                  _buildItemSetting(
                      icon: Icons.attach_money_outlined,
                      name: 'Conta bancaria'),
                  const SizedBox(height: 48),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Especialidades',
                        style: FontStyles.size18Weight400),
                  ),
                  const SizedBox(height: 32),
                  _buildItemSetting(
                      icon: Icons.handyman, name: 'Editar Especialidade'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
