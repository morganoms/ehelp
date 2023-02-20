import 'dart:async';

import 'package:custom_timer/custom_timer.dart';
import 'package:ehelp/features/client/call_now/views/components/card_detail_service.widget.dart';
import 'package:ehelp/locator.dart';
import 'package:ehelp/shared/colors/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/components/back_button.widget.dart';
import '../../../../shared/components/default_dialog.widget.dart';
import '../../../../shared/components/generic_button.widget.dart';

import '../../../../shared/components/header_black.widget.dart';
import '../../../../shared/fonts/styles.dart';
import '../../home/views/components/service_item.widget.dart';
import '../view_model/call_now.view_model.dart';
import 'components/arrived_professinal.widget.dart';
import 'components/calling_professional.widget.dart';
import 'components/feedback_service.widget.dart';
import 'components/finished_service.widget.dart';
import 'components/started_service.widget.dart';
import 'components/waiting_arrive.widget.dart';

class CallNowView extends StatefulWidget {
  const CallNowView({Key? key}) : super(key: key);

  @override
  State<CallNowView> createState() => _CallNowViewViewState();
}

class _CallNowViewViewState extends State<CallNowView>
    with SingleTickerProviderStateMixin {
  late CallNowViewModel _controller;
  late CustomTimerController _timeController;

  @override
  void initState() {
    _controller = locator.get<CallNowViewModel>();
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
    locator.resetLazySingleton<CallNowViewModel>();
    _timeController.dispose();
    super.dispose();
  }

  Widget _buildBottomButtom() {
    if (_controller.screenState == CallNowState.arrived) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GenericButton(
            label: 'Confirmar',
            color: ColorConstants.greenDark,
            onPressed: () => _controller.setScreenState(CallNowState.started),
          ),
          const SizedBox(
            height: 16,
          ),
          GenericButton(
            label: 'Não chegou',
            color: Colors.red.shade400,
            onPressed: () => _controller.setScreenState(CallNowState.waiting),
          ),
        ],
      );
    } else if (_controller.screenState == CallNowState.started) {
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
              _controller.setScreenState(CallNowState.finished);
            },
          ),
        ],
      );
    } else if (_controller.screenState == CallNowState.finished) {
      return GenericButton(
        label: 'Confirmar',
        color: ColorConstants.greenDark,
        onPressed: () => _controller.setScreenState(CallNowState.feedback),
      );
    } else if (_controller.screenState == CallNowState.feedback) {
      return GenericButton(
        label: 'Avaliar',
        color: ColorConstants.greenDark,
        onPressed: () =>
            Navigator.of(context).popUntil(ModalRoute.withName('/home_client')),
      );
    } else {
      return GenericButton(
        label: 'Cancelar Solicitação',
        color: Colors.red.shade400,
        onPressed: () =>
            Navigator.of(context).popUntil(ModalRoute.withName('/home_client')),
      );
    }
  }

  Widget _buildBody() {
    switch (_controller.screenState) {
      case CallNowState.waiting:
        unawaited(Future<void>.delayed(const Duration(seconds: 5))
            .then((value) => _controller.setScreenState(CallNowState.arrived)));
        _controller.setStatusTitle('Solicitação Confirmada');
        return const WaitingArriveWidget();
      case CallNowState.arrived:
        _controller.setStatusTitle('Profissional Chegou');
        return const ArrivedProfessionalWidget();
      case CallNowState.started:
        _controller.setStatusTitle('Serviço Iniciado');
        _timeController.start();
        return StartedServiceWidget(timeController: _timeController);
      case CallNowState.finished:
        _controller.setStatusTitle('Serviço Finalizado');
        return FinishedServiceWidget(
          hours: _timeController.remaining.value.hours,
          minutes: _timeController.remaining.value.minutes,
          seconds: _timeController.remaining.value.seconds,
        );
      case CallNowState.feedback:
        _controller.setStatusTitle('Avalie o Profissional');
        return const FeedbackServiceWidget();
      default:
        unawaited(Future<void>.delayed(const Duration(seconds: 5))
            .then((value) => _controller.setScreenState(CallNowState.waiting)));
        _controller.setStatusTitle('Chamando Agora');
        return const CallingProfessionalWidget();
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
                    onTap: () => Navigator.of(context)
                        .pushNamed(EhelpRoutes.callDetail, arguments: false),
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
