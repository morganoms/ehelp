import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/components/credit_card.widget.dart';
import 'package:flutter/material.dart';

import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/fonts/styles.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          label: 'Chamar',
          onPressed: () =>
              Navigator.of(context).pushNamed(EhelpRoutes.clientCallNowCalling),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 18,
                      ),
                    ),
                  ),
                  Text(
                    'Chamar Agora',
                    style: FontStyles.size16Weight700,
                  ),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              CreditCard()
            ],
          ),
        ),
      ),
    );
  }
}
