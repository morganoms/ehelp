import 'package:ehelp/core/locator.dart';
import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/components/time_selector.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/back_button.widget.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/header_black.widget.dart';
import '../../../../shared/components/stepper.widget.dart';
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
          color: ColorConstants.greenDark,
          label: 'Continuar',
          onPressed: () =>
              Navigator.of(context).pushNamed(EhelpRoutes.clientBookingStep3),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderBlack(
              titleLable: 'Agendamento',
              iconBack: const BackButtonWidget(),
              child: Container(
                color: ColorConstants.blackSoft,
                padding: const EdgeInsets.only(bottom: 16, left: 24, right: 14),
                child: const StepperWidget(totalSteps: 3, totalActiveSteps: 2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
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
          ],
        ),
      ),
    );
  }
}
