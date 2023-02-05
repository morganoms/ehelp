import 'package:ehelp/locator.dart';
import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/components/time_selector.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../shared/components/generic_button.widget.dart';
import '../../../shared/components/stepper.widget.dart';
import '../../../shared/fonts/styles.dart';
import '../view_model/booking.view_model.dart';

class Step2View extends StatelessWidget {
  Step2View({Key? key}) : super(key: key);
  final BookingViewModel _controller = locator.get<BookingViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          label: 'Continuar',
          onPressed: () =>
              Navigator.of(context).pushNamed(EhelpRoutes.clientBookingStep3),
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
              const StepperWidget(totalSteps: 3, totalActiveSteps: 2),
              const SizedBox(
                height: 48,
              ),
              const Text(
                'Selecione a Hora em que deseja realizar o serviço',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 36,
              ),
              Observer(
                builder: (_) {
                  return Flexible(
                    child: TimeSelector(
                      workHours: _controller.workHoursList,
                      // ignore: unnecessary_lambdas
                      onPressed: (final int index, final bool value) =>
                          _controller.setSelectionWorkHour(index, value),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
