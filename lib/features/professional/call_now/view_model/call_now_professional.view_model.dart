import 'package:mobx/mobx.dart';

import '../../../client/call_now/view_model/call_now.view_model.dart';
part 'call_now_professional.view_model.g.dart';

enum CallNowProfessionalState { goToClient, waitingClient, started, finished }

class CallNowProfessionalViewModel = _CallNowProfessionalViewModelBase
    with _$CallNowProfessionalViewModel;

abstract class _CallNowProfessionalViewModelBase with Store {
  @observable
  CallNowProfessionalState screenState = CallNowProfessionalState.goToClient;

  @observable
  String statusTitle = 'Chamando Profissional';

  @action
  String setStatusTitle(final String newState) => statusTitle = newState;

  @action
  CallNowProfessionalState setScreenState(
          final CallNowProfessionalState newState) =>
      screenState = newState;
}
