import 'package:ehelp/features/professional/areas/models/service_area.entity.dart';
import 'package:mobx/mobx.dart';
part 'home_area.view_model.g.dart';

class HomeAreaViewModel = _HomeAreaViewModelBase with _$HomeAreaViewModel;

abstract class _HomeAreaViewModelBase with Store {
  @observable
  String serviceSelected = '';

  @observable
  ObservableList<ServiceAreaEntity> areasList =
      <ServiceAreaEntity>[].asObservable();

  @action
  String setServiceSelected(final String newValue) =>
      serviceSelected = newValue;

  @action
  void addAreaToList(final ServiceAreaEntity newValue) =>
      areasList.add(newValue);

  @action
  void removeAreaToList(final ServiceAreaEntity value) =>
      areasList.remove(value);
}
