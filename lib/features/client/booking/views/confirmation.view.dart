import 'package:ehelp/features/client/booking/view_model/screen_state/book_service.screen_state.dart';
import 'package:ehelp/features/client/home/view_model/controllers/home_client.view_model.dart';
import 'package:ehelp/shared/fonts/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/locator.dart';
import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/generic_error.widget.dart';
import '../../../../shared/components/generic_loading.widget.dart';
import '../../../../shared/components/header_black.widget.dart';
import '../view_model/controllers/booking.view_model.dart';

class ConfirmationView extends StatefulWidget {
  const ConfirmationView({Key? key}) : super(key: key);

  @override
  State<ConfirmationView> createState() => _ConfirmationViewState();
}

class _ConfirmationViewState extends State<ConfirmationView> {
  late BookingViewModel _viewModel;

  @override
  void initState() {
    _viewModel = locator.get<BookingViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      return true;
    }, child: Observer(builder: (_) {
      if (_viewModel.step3State is BookError) {
        return GenericError(
          requestError: (_viewModel.step3State as BookError).requestError,
        );
      } else if (_viewModel.step3State is BookLoading) {
        return const GenericLoading();
      } else {
        return _buildSuccess(context);
      }
    }));
  }

  Widget _buildSuccess(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
            label: 'Voltar ao início',
            color: ColorConstants.greenDark,
            onPressed: () {
              locator.resetLazySingleton<HomeClientViewModel>();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  EhelpRoutes.homeClient,
                  (final Route<dynamic> route) => false);
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderBlack(
              titleLable: 'Agendamento Finalizado',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset('assets/animations/check2.json',
                      repeat: false,
                      height: MediaQuery.of(context).size.height / 4),
                  Text(
                    'Você poderá acompanhar a confirmação do seu agendamento'
                    ' pelo profissional na aba de Atividade do seu aplicativo. '
                    '\n\nCaso o profissional não confirme em até 2 hrs antes da sua '
                    'data e hora selecionada, a solicitação expirará e você precisará '
                    'solicitar novamente.',
                    style: FontStyles.size18Weight400,
                    textAlign: TextAlign.center,
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
