import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/components/credit_card.widget.dart';
import 'package:flutter/material.dart';

import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/stepper.widget.dart';
import '../../../../shared/fonts/styles.dart';

class Step3View extends StatelessWidget {
  const Step3View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          label: 'Agendar',
          onPressed: () => Navigator.of(context)
              .pushNamed(EhelpRoutes.clientBookingConfirmation),
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
                    'Agendamento',
                    style: FontStyles.size16Weight700,
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const StepperWidget(totalSteps: 3, totalActiveSteps: 3),
              const SizedBox(
                height: 48,
              ),
              CreditCard(),
            ],
          ),
        ),
      ),
    );
  }
}
