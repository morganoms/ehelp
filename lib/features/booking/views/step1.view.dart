import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/components/generic_button.widget.dart';
import 'package:ehelp/shared/components/stepper.widget.dart';
import 'package:ehelp/shared/fonts/styles.dart';
import 'package:flutter/material.dart';

class Step1View extends StatelessWidget {
  const Step1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          label: 'Continuar',
          onPressed: () =>
              Navigator.of(context).pushNamed(EhelpRoutes.clientBookingStep2),
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
              const StepperWidget(totalSteps: 3, totalActiveSteps: 1),
              const SizedBox(
                height: 48,
              ),
              const Text('Selecione o Dia em que deseja realizar o serviço'),
              const SizedBox(
                height: 36,
              ),
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                    selectedDayHighlightColor: Colors.black),
                initialValue: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
