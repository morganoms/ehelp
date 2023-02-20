import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/components/credit_card.widget.dart';
import 'package:flutter/material.dart';

import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/back_button.widget.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/header_black.widget.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          color: ColorConstants.greenDark,
          label: 'Chamar',
          onPressed: () =>
              Navigator.of(context).pushNamed(EhelpRoutes.clientCallNowCalling),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderBlack(
              titleLable: 'Chamar Agora',
              iconBack: BackButtonWidget(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [CreditCard()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
