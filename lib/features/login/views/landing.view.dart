import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/colors/constants.dart';
import 'package:ehelp/shared/models/user_type.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../shared/components/generic_button.widget.dart';

class LandingView extends StatelessWidget {
  const LandingView({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: ColorConstants.blackSoft,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Bem Vindo',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Selecione abaixo o perfil em que deseja entrar no aplicativo.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding:
                  EdgeInsets.only(right: MediaQuery.of(context).size.width / 2),
              child: const Divider(
                thickness: 1,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            GenericButton(
              label: 'Cliente',
              color: ColorConstants.greenDark,
              onPressed: () => Navigator.of(context).pushNamed(
                EhelpRoutes.login,
                arguments: UserType.client,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            GenericButton(
              label: 'Profissional',
              color: ColorConstants.greenDark,
              onPressed: () => Navigator.of(context).pushNamed(
                EhelpRoutes.login,
                arguments: UserType.professional,
              ),
            ),
          ],
        ),
      ),
      body: FadeInImage(
        placeholder: MemoryImage(kTransparentImage),
        image: const AssetImage(
          'assets/images/worker1.jpg',
        ),
      ),
    );
  }
}
