import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'call_now_professional.view_model.g.dart';

enum CallNowProfessionalState {
  goToClient,
  waitingClient,
  started,
  finished,
  prove
}

class CallNowProfessionalViewModel = _CallNowProfessionalViewModelBase
    with _$CallNowProfessionalViewModel;

abstract class _CallNowProfessionalViewModelBase with Store {
  @observable
  CallNowProfessionalState screenState = CallNowProfessionalState.goToClient;

  @observable
  String statusTitle = 'Chamando Profissional';

  @observable
  List<XFile?> selectedImages = <XFile?>[].asObservable();

  @action
  void addImageToList(final XFile? newValue) => selectedImages.add(newValue);

  @action
  void addImageAllToList(final List<XFile?> newValue) =>
      selectedImages.addAll(newValue);

  @action
  void removeImageToList(final XFile? value) => selectedImages.remove(value);

  @action
  String setStatusTitle(final String newState) => statusTitle = newState;

  @action
  CallNowProfessionalState setScreenState(
          final CallNowProfessionalState newState) =>
      screenState = newState;
}
