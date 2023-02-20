import 'package:mobx/mobx.dart';
part 'call_now.view_model.g.dart';

enum CallNowState { calling, waiting, arrived, started, finished, feedback }

class CallNowViewModel = _CallNowViewModelBase with _$CallNowViewModel;

abstract class _CallNowViewModelBase with Store {
  @observable
  CallNowState screenState = CallNowState.calling;

  @observable
  String statusTitle = 'Chamando Profissional';

  @action
  String setStatusTitle(final String newState) => statusTitle = newState;

  @action
  CallNowState setScreenState(final CallNowState newState) =>
      screenState = newState;
}
