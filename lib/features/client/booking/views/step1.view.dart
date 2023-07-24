import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/colors/constants.dart';
import 'package:ehelp/shared/components/generic_button.widget.dart';
import 'package:ehelp/shared/components/stepper.widget.dart';
import 'package:flutter/material.dart';

import '../../../../shared/components/back_button.widget.dart';
import '../../../../shared/components/header_black.widget.dart';

class Step1View extends StatelessWidget {
  const Step1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          label: 'Continuar',
          color: ColorConstants.greenDark,
          onPressed: () =>
              Navigator.of(context).pushNamed(EhelpRoutes.clientBookingStep2),
        ),
      ),
      body: Column(
        children: [
          HeaderBlack(
            titleLable: 'Agendamento',
            iconBack: const BackButtonWidget(),
            child: Container(
                color: ColorConstants.blackSoft,
                padding: const EdgeInsets.only(bottom: 16, left: 24, right: 14),
                child: const StepperWidget(totalSteps: 3, totalActiveSteps: 1)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
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
        ],
      ),
    );
  }
}
