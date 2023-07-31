import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/components/credit_card.widget.dart';
import 'package:flutter/material.dart';

import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/back_button.widget.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/header_black.widget.dart';
import '../../../../shared/components/stepper.widget.dart';

class Step3View extends StatelessWidget {
  const Step3View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          label: 'Agendar',
          color: ColorConstants.greenDark,
          onPressed: () => Navigator.of(context)
              .pushNamed(EhelpRoutes.clientBookingConfirmation),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderBlack(
              titleLable: 'Agendamento',
              iconBack: BackButtonWidget(),
              child: Container(
                color: ColorConstants.blackSoft,
                padding: const EdgeInsets.only(bottom: 16, left: 24, right: 14),
                child: const StepperWidget(totalSteps: 3, totalActiveSteps: 3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  CreditCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
