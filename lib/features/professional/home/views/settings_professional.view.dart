import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/components/generic_button.widget.dart';
import 'package:ehelp/shared/fonts/styles.dart';
import 'package:flutter/material.dart';

import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/header_background.widget.dart';
import '../../../../shared/components/header_black.widget.dart';

class SettingsProfesssionalView extends StatelessWidget {
  const SettingsProfesssionalView({Key? key}) : super(key: key);

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
                const SizedBox(width: 16),
                Icon(
                  icon,
                  size: 32,
                  color: ColorConstants.greenDark,
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
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: HeaderBlack(
            titleLable: 'Configurações',
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Conta', style: FontStyles.size18Weight400),
                ),
                const SizedBox(height: 32),
                _buildItemSetting(
                  icon: Icons.person_2_outlined,
                  name: 'Meu perfil',
                  context: context,
                  route: EhelpRoutes.professionalProfile,
                ),
                const SizedBox(height: 32),
                _buildItemSetting(
                  icon: Icons.attach_money_outlined,
                  name: 'Conta bancaria',
                  context: context,
                  route: EhelpRoutes.professionalBanckAccount,
                ),
                const SizedBox(height: 48),
                Align(
                  alignment: Alignment.centerLeft,
                  child:
                      Text('Especialidades', style: FontStyles.size18Weight400),
                ),
                const SizedBox(height: 32),
                _buildItemSetting(
                  icon: Icons.handyman,
                  name: 'Editar Especialidade',
                  context: context,
                  route: EhelpRoutes.homeArea,
                  arg: true,
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.bottomCenter,
            child: GenericButton(
              label: 'Sair da conta',
              color: Colors.transparent,
              labelStyle: FontStyles.size16Weight500blue,
              borderColor: ColorConstants.primaryLight,
              onPressed: () => Navigator.of(context).popUntil(
                ModalRoute.withName(EhelpRoutes.landing),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
