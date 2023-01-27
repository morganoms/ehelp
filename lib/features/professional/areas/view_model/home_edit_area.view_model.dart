import 'package:ehelp/features/professional/areas/models/working_hours.entity.dart';
import 'package:ehelp/shared/constants/default_area.dart';
import 'package:mobx/mobx.dart';

import '../models/week_days.entity.dart';
part 'home_edit_area.view_model.g.dart';

class HomeEditAreaViewModel = _HomeEditAreaViewModelBase
    with _$HomeEditAreaViewModel;

abstract class _HomeEditAreaViewModelBase with Store {
  @observable
  bool isUtilDays = false;

  @observable
  bool isComercialHours = false;

  @observable
  double valuCharged = 0;

  @observable
  ObservableList<String> certificationList = <String>[].asObservable();

  @observable
  ObservableList<WeekDays> workDaysList =
      DefaultArea.workDaysList.asObservable();

  @observable
  ObservableList<WorkingHours> workHoursList =
      DefaultArea.workHoursList.asObservable();

  @action
  double setValueCharged(final double value) => valuCharged = value;

  @action
  void setSelectionWeekDay(final int index, final bool value) {
    workDaysList[index].selected = value;
    workDaysList = workDaysList;
  }

  @action
  void setSelectionWorkHour(final int index, final bool value) {
    workHoursList[index].selected = value;
    workHoursList = workHoursList;
  }

  @action
  void setComercialHours(final bool newvalue) {
    isComercialHours = newvalue;

    for (var i = 0; i < workHoursList.length; i++) {
      if (i != workHoursList.length - 1 && workHoursList[i].isAvaliable) {
        workHoursList[i].selected = newvalue;
      } else {
        workHoursList[i].selected = false;
      }
    }
    workHoursList = workHoursList;
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
