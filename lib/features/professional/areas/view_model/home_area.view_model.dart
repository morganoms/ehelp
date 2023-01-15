import 'package:mobx/mobx.dart';
part 'home_area.view_model.g.dart';

class HomeAreaViewModel = _HomeAreaViewModelBase with _$HomeAreaViewModel;

abstract class _HomeAreaViewModelBase with Store {
  @observable
  String serviceSelected = '';
  @action
  String setServiceSelected(final String newValue) =>
      serviceSelected = newValue;
}
