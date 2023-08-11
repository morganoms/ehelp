import 'package:ehelp/core/locator.dart';
import 'package:ehelp/features/client/booking/view_model/screen_state/booking_client.screen_state.dart';
import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/back_button.widget.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/generic_error.widget.dart';
import '../../../../shared/components/generic_loading.widget.dart';
import '../../../../shared/components/header_black.widget.dart';
import '../../../../shared/components/stepper.widget.dart';
import '../../home/model/entity/service_for_client.entity.dart';
import '../view_model/controllers/booking.view_model.dart';

class Step2View extends StatefulWidget {
  const Step2View({required this.userProvider, Key? key}) : super(key: key);

  final ServiceForClientEntity userProvider;

  @override
  State<Step2View> createState() => _Step2ViewState();
}

class _Step2ViewState extends State<Step2View> {
  late BookingViewModel _viewModel;

  @override
  void initState() {
    _viewModel = locator.get<BookingViewModel>();
    _viewModel.setactiveStep(BookingSteps.step2);

    WidgetsBinding.instance.addPostFrameCallback((final _) async => loadData());
    super.initState();
  }

  void loadData() => _viewModel.getWorkHours(widget.userProvider.userId);

  List<WheelChoice> getChoices(final List<int> bookedHours) {
    final List<WheelChoice> hourList = [];
    for (var i = 8; i < 20; i++) {
      if (!bookedHours.contains(i)) {
        hourList.add(
          WheelChoice(value: i, title: '$i:00'),
        );
      }
    }
    final int middleItem = hourList.length ~/ 2;
    _viewModel.setMainEntity(
      null,
      hourList[middleItem].value,
    );
    return hourList;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      _viewModel.setactiveStep(BookingSteps.step1);
      return true;
    }, child: Observer(builder: (_) {
      if (_viewModel.step2State is ScreenError) {
        return GenericError(
            requestError: (_viewModel.step2State as ScreenError).requestError);
      } else if (_viewModel.step2State is ScreenLoading) {
        return const GenericLoading();
      } else {
        return _buildSuccess((_viewModel.step2State as ScreenSuccess).data);
      }
    }));
  }

  Widget _buildSuccess(final List<int> bookedHours) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          color: ColorConstants.greenDark,
          label: 'Continuar',
          onPressed: () => Navigator.of(context).pushNamed(
              EhelpRoutes.clientBookingStep3,
              arguments: widget.userProvider),
        ),
      ),
      body: Column(
        children: [
          HeaderBlack(
            titleLable: 'Agendamento',
            iconBack: BackButtonWidget(
              onTap: () {
                _viewModel.setactiveStep(BookingSteps.step2);
                Navigator.of(context).pop();
              },
            ),
            child: Container(
              color: ColorConstants.blackSoft,
              padding: const EdgeInsets.only(bottom: 16, left: 24, right: 14),
              child: const StepperWidget(totalSteps: 3, totalActiveSteps: 2),
            ),
          ),
          Expanded(
            child: Padding(
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
                  Expanded(
                    child: WheelChooser<int>.choices(
                        startPosition: getChoices(bookedHours).length ~/ 2,
                        selectTextStyle: const TextStyle(
                            color: ColorConstants.greenDark,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                        choices: getChoices(bookedHours),
                        onChoiceChanged: (value) {
                          _viewModel.setMainEntity(null, value);
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
