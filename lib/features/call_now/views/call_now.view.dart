import 'dart:async';

import 'package:custom_timer/custom_timer.dart';
import 'package:ehelp/features/call_now/views/components/arrived_professinal.widget.dart';
import 'package:ehelp/features/call_now/views/components/calling_professional.widget.dart';
import 'package:ehelp/features/call_now/views/components/feedback_service.widget.dart';
import 'package:ehelp/features/call_now/views/components/finished_service.widget.dart';
import 'package:ehelp/features/home/views/components/service_item.widget.dart';
import 'package:ehelp/locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../shared/components/generic_button.widget.dart';
import '../../../shared/fonts/styles.dart';
import '../view_model/call_now.view_model.dart';
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
          Text(
            r'R$ 50,00',
            style: FontStyles.size24Weight700,
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
        onPressed: () => _controller.setScreenState(CallNowState.feedback),
      );
    } else if (_controller.screenState == CallNowState.feedback) {
      return GenericButton(
        label: 'Avaliar',
        onPressed: () {},
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
        return const WaitingArriveWidget();
      case CallNowState.arrived:
        return const ArrivedProfessionalWidget();
      case CallNowState.started:
        _timeController.start();
        return StartedServiceWidget(timeController: _timeController);
      case CallNowState.finished:
        return FinishedServiceWidget(
          hours: _timeController.remaining.value.hours,
          minutes: _timeController.remaining.value.minutes,
          seconds: _timeController.remaining.value.seconds,
        );
      case CallNowState.feedback:
        return const FeedbackServiceWidget();
      default:
        unawaited(Future<void>.delayed(const Duration(seconds: 5))
            .then((value) => _controller.setScreenState(CallNowState.waiting)));
        return const CallingProfessionalWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: Observer(
          builder: (final _) => _buildBottomButtom(),
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
                        Icons.close_rounded,
                      ),
                    ),
                  ),
                  Text(
                    'Chamar Agora',
                    style: FontStyles.size16Weight700,
                  ),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              ServiceItemWidget(),
              const SizedBox(
                height: 32,
              ),
              Observer(
                builder: (final _) => _buildBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
