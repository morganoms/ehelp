import 'package:ehelp/features/client/booking/view_model/screen_state/book_service.screen_state.dart';
import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:ehelp/shared/components/credit_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/locator.dart';
import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/back_button.widget.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/header_black.widget.dart';
import '../../../../shared/components/stepper.widget.dart';
import '../../home/model/entity/service_for_client.entity.dart';
import '../view_model/controllers/booking.view_model.dart';

class Step3View extends StatefulWidget {
  const Step3View({required this.userProvider, Key? key}) : super(key: key);

  final ServiceForClientEntity userProvider;

  @override
  State<Step3View> createState() => _Step3ViewState();
}

class _Step3ViewState extends State<Step3View> {
  late BookingViewModel _viewModel;

  @override
  void initState() {
    _viewModel = locator.get<BookingViewModel>();
    _viewModel.setactiveStep(BookingSteps.step3);

    super.initState();
  }

  Future<void> onBook() async {
    await _viewModel.bookService(
        widget.userProvider.userId, widget.userProvider.specialtyId);
    await Navigator.of(context)
        .pushNamed(EhelpRoutes.clientBookingConfirmation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Observer(builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: GenericButton(
            label: 'Agendar',
            loading: _viewModel.step3State is BookLoading,
            color: ColorConstants.greenDark,
            onPressed: onBook,
          ),
        );
      }),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
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
