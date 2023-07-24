import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/colors/constants.dart';
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
                'Conecte-se facilmente a prestadores de serviço confiáveis e qualificados com nosso aplicativo, trazendo conveniência e eficiência para suas necessidades diárias.',
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
              label: 'ENTRAR',
              color: ColorConstants.greenDark,
              onPressed: () => Navigator.of(context).pushNamed(
                EhelpRoutes.login,
              ),
            ),
            const SizedBox(
              height: 36,
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
