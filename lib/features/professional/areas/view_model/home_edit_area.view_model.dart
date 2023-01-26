import 'package:mobx/mobx.dart';

import '../models/week_days.entity.dart';
part 'home_edit_area.view_model.g.dart';

class HomeEditAreaViewModel = _HomeEditAreaViewModelBase
    with _$HomeEditAreaViewModel;

abstract class _HomeEditAreaViewModelBase with Store {
  @observable
  bool isUtilDays = false;

  @observable
  ObservableList<String> certificationList = <String>[].asObservable();

  @observable
  ObservableList<WeekDays> workDaysList = <WeekDays>[
    WeekDays(
      dayName: 'Segunda',
      selected: false,
    ),
    WeekDays(
      dayName: 'Terça',
      selected: false,
    ),
    WeekDays(
      dayName: 'Quarta',
      selected: false,
    ),
    WeekDays(
      dayName: 'Quinta',
      selected: false,
    ),
    WeekDays(
      dayName: 'Sexta',
      selected: false,
    ),
    WeekDays(
      dayName: 'Sábado',
      selected: false,
    ),
    WeekDays(
      dayName: 'Domingo',
      selected: false,
    ),
  ].asObservable();

  @action
  void setSelectionWeekDay(final int index, final bool value) {
    workDaysList[index].selected = value;
    workDaysList = workDaysList;
  }

  @action
  void setUtilDays(final bool newvalue) {
    isUtilDays = newvalue;

    for (var i = 0; i < workDaysList.length; i++) {
      if (i < 5) {
        workDaysList[i].selected = newvalue;
      } else {
        workDaysList[i].selected = false;
      }
    }
    workDaysList = workDaysList;
  }

  @action
  void addCertificationToList(final String newValue) =>
      certificationList.add(newValue);

  @action
  void removeCertificationToList(final String value) =>
      certificationList.remove(value);
}
