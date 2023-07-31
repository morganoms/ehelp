import 'package:mobx/mobx.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../core/http/http_core_error.dart';
import '../../../../../shared/constants/default_area.dart';
import '../../../../../shared/utils/mathod_handler.dart';
import '../../../../professional/areas/models/working_hours.entity.dart';
import '../../models/entity/booking.entity.dart';
import '../../models/service/booking_client.service.dart';
import '../screen_state/booking_client.screen_state.dart';
part 'booking.view_model.g.dart';

enum BookingSteps { step1, step2, step3, confirmatio }

class BookingViewModel = _BookingViewModelBase with _$BookingViewModel;

abstract class _BookingViewModelBase with Store {
  _BookingViewModelBase(this.service);

  final BookingClientService service;

  @observable
  bool isComercialHours = false;

  @observable
  Booking mainEntity = Booking();

  @observable
  BookingSteps activeStep = BookingSteps.step1;

  @observable
  ObservableList<WorkingHours> workHoursList =
      DefaultArea.workHoursList.asObservable();

  @action
  Booking setMainEntity(final DateTime? newDay, final int? newHour) =>
      mainEntity = Booking(
          selectedDay: newDay ?? mainEntity.selectedDay,
          selectedHour: newHour ?? mainEntity.selectedHour);

  @action
  BookingSteps setactiveStep(final BookingSteps newBookingStep) =>
      activeStep = newBookingStep;

  @observable
  BookingClientScreenStatus step1State = BookingClientScreenStatus.loading();

  @observable
  BookingClientScreenStatus step2State = BookingClientScreenStatus.loading();

  @computed
  bool get isLoading {
    if (activeStep == BookingSteps.step1) {
      return step1State is ScreenLoading;
    } else {
      return step2State is ScreenLoading;
    }
  }

  @computed
  bool get hasError {
    if (activeStep == BookingSteps.step1) {
      return step1State is ScreenError;
    } else {
      return step2State is ScreenError;
    }
  }

  @computed
  bool get isSuccess {
    if (activeStep == BookingSteps.step1) {
      return step1State is ScreenSuccess;
    } else {
      return step2State is ScreenSuccess;
    }
  }

  @action
  void setSelectionWorkHour(final int index, final bool value) {
    workHoursList[index].selected = value;
    workHoursList = workHoursList;
  }

  @action
  void setComercialHours(final bool newValue) {
    isComercialHours = newValue;

    for (var i = 0; i < workHoursList.length; i++) {
      if (i != workHoursList.length - 1 && workHoursList[i].isAvaliable) {
        workHoursList[i].selected = newValue;
      } else {
        workHoursList[i].selected = false;
      }
    }
    workHoursList = workHoursList;
  }

  @action
  Future<void> getWorkDays(final int providerId) async {
    step1State = BookingClientScreenStatus.loading();
    final Result<List<int>, HttpCoreError> response =
        await MethodHandler.errorState<List<int>>(
            () => service.getWorkDays(providerId));

    response.when(
      (success) => step1State = BookingClientScreenStatus.success(success),
      (error) => step1State = BookingClientScreenStatus.error(error),
    );
  }

  @action
  Future<void> getWorkHours(final int providerId) async {
    step2State = BookingClientScreenStatus.loading();
    final Result<List<int>, HttpCoreError> response =
        await MethodHandler.errorState<List<int>>(
            () => service.getWorkHours(providerId, mainEntity.selectedDay!));

    response.when(
      (success) => step2State = BookingClientScreenStatus.success(success),
      (error) => step2State = BookingClientScreenStatus.error(error),
    );
  }
}