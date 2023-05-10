import 'dart:async';

import 'package:custom_timer/custom_timer.dart';
import 'package:ehelp/features/client/call_now/views/components/card_detail_service.widget.dart';
import 'package:ehelp/features/professional/call_now/views/components/finished_service_professional.widget.dart';
import 'package:ehelp/features/professional/call_now/views/components/go_to_client.widget.dart';
import 'package:ehelp/features/professional/call_now/views/components/service_prove_professional.widget.dart';
import 'package:ehelp/features/professional/call_now/views/components/started_service_professional.widget.dart';
import 'package:ehelp/features/professional/call_now/views/components/waiting_client.widget.dart';
import 'package:ehelp/core/locator.dart';
import 'package:ehelp/shared/colors/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/components/back_button.widget.dart';
import '../../../../shared/components/default_dialog.widget.dart';
import '../../../../shared/components/generic_button.widget.dart';

import '../../../../shared/components/header_black.widget.dart';
import '../../../../shared/fonts/styles.dart';
import '../view_model/call_now_professional.view_model.dart';

class CallNowProfessionalView extends StatefulWidget {
  const CallNowProfessionalView({Key? key}) : super(key: key);

  @override
  State<CallNowProfessionalView> createState() =>
      _CallNowProfessionalViewViewState();
}

class _CallNowProfessionalViewViewState extends State<CallNowProfessionalView>
    with SingleTickerProviderStateMixin {
  late CallNowProfessionalViewModel _controller;
  late CustomTimerController _timeController;

  @override
  void initState() {
    _controller = locator.get<CallNowProfessionalViewModel>();
    _timeController = CustomTimerController(
      vsync: this,
      begin: const Duration(),
      end: const Duration(hours: 24),
      interval: CustomTimerInterval.seconds,
    );
    super.initState();
  }

  @override
  void dispose() {
    locator.resetLazySingleton<CallNowProfessionalViewModel>();
    _timeController.dispose();
    super.dispose();
  }

  Widget _buildBottomButtom() {
    if (_controller.screenState == CallNowProfessionalState.goToClient) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GenericButton(
            label: 'Cheguei ao Local',
            color: ColorConstants.greenDark,
            onPressed: () => _controller
                .setScreenState(CallNowProfessionalState.waitingClient),
          ),
          const SizedBox(
            height: 16,
          ),
          GenericButton(
            label: 'Cancelar Chamado',
            color: Colors.red.shade400,
            onPressed: () => Navigator.of(context)
                .popUntil(ModalRoute.withName('/professional/home')),
          ),
        ],
      );
    } else if (_controller.screenState == CallNowProfessionalState.started) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Valor a pagar até o momento',
            style: FontStyles.size16Weight400,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                r'R$ 50,00',
                style: FontStyles.size24Weight700,
              ),
              IconButton(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (builder) => DefaultDialog(
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            child: Text(
                              'Atenção! \n\nA forma de pagamento do serviço será calculada de acordo com o tempo gasto.',
                              style: FontStyles.size16Weight400,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                  icon: const Icon(Icons.help_outline_rounded))
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          GenericButton(
            label: 'Finalizar Serviço',
            color: Colors.red.shade400,
            onPressed: () {
              _timeController.pause();
              _controller.setScreenState(CallNowProfessionalState.finished);
            },
          ),
        ],
      );
    } else if (_controller.screenState == CallNowProfessionalState.finished) {
      return GenericButton(
        label: 'Confirmar',
        color: ColorConstants.greenDark,
        onPressed: () =>
            _controller.setScreenState(CallNowProfessionalState.prove),
      );
    } else if (_controller.screenState == CallNowProfessionalState.prove) {
      return GenericButton(
        label: 'Enviar Relatório',
        color: ColorConstants.greenDark,
        onPressed: () => Navigator.of(context)
            .popUntil(ModalRoute.withName('/professional/home')),
      );
    } else {
      return GenericButton(
        label: 'Cancelar Solicitação',
        color: Colors.red.shade400,
        onPressed: () => Navigator.of(context)
            .popUntil(ModalRoute.withName('/professional/home')),
      );
    }
  }

  Widget _buildBody() {
    switch (_controller.screenState) {
      case CallNowProfessionalState.waitingClient:
        unawaited(Future<void>.delayed(const Duration(seconds: 5)).then(
            (value) =>
                _controller.setScreenState(CallNowProfessionalState.started)));
        _controller.setStatusTitle('Aguardando Cliente');
        return const WaitingClientWidget();
      case CallNowProfessionalState.started:
        _controller.setStatusTitle('Serviço Iniciado');
        _timeController.start();
        return StartedServiceProfissional(timeController: _timeController);
      case CallNowProfessionalState.prove:
        _controller.setStatusTitle('Prova do Serviço');
        return ServiceProveProfessionalWidget();
      case CallNowProfessionalState.finished:
        _controller.setStatusTitle('Serviço Finalizado');
        return FinishedServiceProfessinalWidget(
          hours: _timeController.remaining.value.hours,
          minutes: _timeController.remaining.value.minutes,
          seconds: _timeController.remaining.value.seconds,
        );

      default:
        _controller.setStatusTitle('Dirija-se ao Local');
        return const GoToClientWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Observer(
                builder: (final _) => _buildBottomButtom(),
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HeaderBlack(
              titleLable: 'Chamar Agora',
              iconBack: const BackButtonWidget(isCancelButton: true),
              child: Container(
                width: double.maxFinite,
                color: ColorConstants.blackSoft,
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ColorConstants.greenStrong,
                  ),
                  child: Column(children: [
                    Text(
                      'Status',
                      style: FontStyles.size16Weight400,
                      textAlign: TextAlign.center,
                    ),
                    Observer(builder: (_) {
                      return Text(
                        _controller.statusTitle,
                        style: FontStyles.size20Weight700,
                      );
                    }),
                  ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  CardDetailServiceWidget(
                    isClient: true,
                    onTap: () => Navigator.of(context)
                        .pushNamed(EhelpRoutes.callDetail, arguments: true),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Observer(
                    builder: (final _) => _buildBody(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
