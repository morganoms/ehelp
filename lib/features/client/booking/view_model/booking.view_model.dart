import 'package:mobx/mobx.dart';

import '../../../../shared/constants/default_area.dart';
import '../../../professional/areas/models/working_hours.entity.dart';
part 'booking.view_model.g.dart';

class BookingViewModel = _BookingViewModelBase with _$BookingViewModel;

abstract class _BookingViewModelBase with Store {
  @observable
  bool isComercialHours = false;
  @observable
  ObservableList<WorkingHours> workHoursList =
      DefaultArea.workHoursList.asObservable();

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
}
