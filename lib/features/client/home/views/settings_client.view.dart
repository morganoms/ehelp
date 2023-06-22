import 'package:ehelp/core/locator.dart';
import 'package:ehelp/core/user/user.controller.dart';
import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/fonts/styles.dart';
import 'package:flutter/material.dart';

import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/header_black.widget.dart';

class SettingsClientView extends StatelessWidget {
  SettingsClientView({Key? key}) : super(key: key);

  final UserController _userController = locator.get<UserController>();

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
      physics: const ClampingScrollPhysics(),
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
                _buildItemSetting(
                    icon: Icons.person_2_outlined,
                    name: 'Minha conta',
                    context: context,
                    route: EhelpRoutes.clientProfile),
                const SizedBox(height: 48),
                _buildItemSetting(
                    icon: Icons.location_on_outlined,
                    name: 'Endereços',
                    context: context,
                    route: EhelpRoutes.clientAdresses),
                const SizedBox(height: 48),
                _buildItemSetting(
                    icon: Icons.credit_card_outlined,
                    name: 'Meus cartões',
                    context: context,
                    route: EhelpRoutes.clientCreditCard),
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
                onPressed: () {
                  _userController.removeUserOnDevice().then((value) =>
                      Navigator.of(context)
                          .popUntil(ModalRoute.withName(EhelpRoutes.landing)));
                }),
          ),
        )
      ],
    );
  }
}
