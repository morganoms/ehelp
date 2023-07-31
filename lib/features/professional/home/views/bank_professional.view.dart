import 'package:ehelp/shared/components/header_black.widget.dart';
import 'package:flutter/material.dart';

import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/back_button.widget.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/fonts/styles.dart';

class BankProfessionalView extends StatelessWidget {
  const BankProfessionalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          label: 'Editar',
          color: ColorConstants.greenDark,
          onPressed: () => Navigator.of(context)
              .pushNamed(EhelpRoutes.bankingProfessional, arguments: true),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderBlack(
              titleLable: 'Conta bancária',
              iconBack: BackButtonWidget(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
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
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/bb.png',
                          height: 80,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Banco do Brasil',
                              style: FontStyles.size16Weight700,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text('7878-X',
                                    style: FontStyles.size14Weight500grey),
                                const SizedBox(width: 16),
                                Text('10.101-2',
                                    style: FontStyles.size14Weight500grey),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Conta Corrente',
                              style: FontStyles.size14Weight500grey,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
