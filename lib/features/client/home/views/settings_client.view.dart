import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/fonts/styles.dart';
import 'package:flutter/material.dart';

import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/header_background.widget.dart';

class SettingsClientView extends StatelessWidget {
  const SettingsClientView({Key? key}) : super(key: key);

  Widget _buildItemSetting({
    required String name,
    required IconData icon,
    required String route,
    required BuildContext context,
    final Object? arg,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(route, arguments: arg),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
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
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: [
        const HeaderBackground(),
        SingleChildScrollView(
          child: SafeArea(
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
                  _buildItemSetting(
                      icon: Icons.person_2_outlined,
                      name: 'Minha conta',
                      context: context,
                      route: EhelpRoutes.professionalProfile),
                  const SizedBox(height: 48),
                  _buildItemSetting(
                      icon: Icons.location_on_outlined,
                      name: 'Endereços',
                      context: context,
                      route: EhelpRoutes.clientUserProfessionalProfile),
                  const SizedBox(height: 48),
                  _buildItemSetting(
                      icon: Icons.credit_card_outlined,
                      name: 'Meus cartões',
                      context: context,
                      route: EhelpRoutes.clientUserProfessionalProfile),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}