import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:ehelp/core/locator.dart';
import 'package:ehelp/features/client/booking/view_model/controllers/booking.view_model.dart';
import 'package:ehelp/features/client/booking/view_model/screen_state/booking_client.screen_state.dart';
import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/colors/constants.dart';
import 'package:ehelp/shared/components/generic_button.widget.dart';
import 'package:ehelp/shared/components/stepper.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../shared/components/back_button.widget.dart';
import '../../../../shared/components/generic_error.widget.dart';
import '../../../../shared/components/generic_loading.widget.dart';
import '../../../../shared/components/header_black.widget.dart';

class Step1View extends StatefulWidget {
  const Step1View({required this.userId, Key? key}) : super(key: key);

  final int userId;

  @override
  State<Step1View> createState() => _Step1ViewState();
}

class _Step1ViewState extends State<Step1View> {
  late BookingViewModel _viewModel;
  final activeStep = BookingSteps.step1;

  @override
  void initState() {
    _viewModel = locator.get<BookingViewModel>();
    _viewModel.setactiveStep(BookingSteps.step1);
    WidgetsBinding.instance.addPostFrameCallback((final _) async => loadData());
    super.initState();
  }

  @override
  void dispose() {
    locator.resetLazySingleton<BookingViewModel>();
    super.dispose();
  }

  void loadData() => _viewModel.getWorkDays(widget.userId);

  bool defineSelectableDays(DateTime day) {
    final List<int> workDays = (_viewModel.step1State as ScreenSuccess).data;
    final bool isPastDay = !day
        .difference(DateTime.now().subtract(const Duration(days: 1)))
        .isNegative;
    final bool isWorkday = workDays.contains(day.weekday);
    return isPastDay && isWorkday;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      return true;
    }, child: Observer(builder: (_) {
      if (_viewModel.hasError) {
        return GenericError(
            requestError: (_viewModel.step1State as ScreenError).requestError);
      } else if (_viewModel.isSuccess) {
        return _buildSuccess();
      } else {
        return const GenericLoading();
      }
    }));
  }

  Widget _buildSuccess() {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: Observer(builder: (_) {
          return GenericButton(
            label: 'Continuar',
            disabled: _viewModel.mainEntity.selectedDay == null,
            color: ColorConstants.greenDark,
            onPressed: () => Navigator.of(context).pushNamed(
                EhelpRoutes.clientBookingStep2,
                arguments: widget.userId),
          );
        }),
      ),
      body: Column(
        children: [
          HeaderBlack(
            titleLable: 'Agendamento',
            iconBack: BackButtonWidget(),
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
                      calendarType: CalendarDatePicker2Type.single,
                      disableYearPicker: true,
                      selectableDayPredicate: defineSelectableDays,
                      selectedDayTextStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      dayTextStyle: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                      disabledDayTextStyle: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                      selectedDayHighlightColor: ColorConstants.greenDark),
                  initialValue: [_viewModel.mainEntity.selectedDay],
                  onValueChanged: (value) =>
                      _viewModel.setMainEntity(value.first, null),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
