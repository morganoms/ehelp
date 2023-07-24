import 'package:ehelp/features/client/home/model/entity/home_client.entity.dart';
import 'package:ehelp/features/client/home/model/service/home_client.service.dart';
import 'package:ehelp/shared/models/screen_state.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../core/http/http_core_error.dart';
import '../../../../../core/locator.dart';
import '../../../../../core/session/session.controller.dart';
import '../../../../../shared/entity/speciality.entity.dart';
import '../../../../../shared/entity/user/authenticate.entity.dart';
import '../../../../../shared/entity/user/user.entity.dart';
import '../../../../../shared/utils/mathod_handler.dart';
import '../../model/entity/service_for_client.entity.dart';
import '../screen_state/home_client.screen_state.dart';
part 'home_client.view_model.g.dart';

class HomeClientViewModel = HomeClientViewModelBase with _$HomeClientViewModel;

abstract class HomeClientViewModelBase with Store {
  HomeClientViewModelBase(this.service);

  final HomeClientService service;

  final SessionController _sessionController = locator.get<SessionController>();

  @observable
  int bottomBarIndex = 1;
  @observable
  int tabActivityIndex = 0;
  @observable
  SpecialityEntity? serviceSelected;

  ObservableList<ServiceForClientEntity> listProvidersSelected =
      <ServiceForClientEntity>[].asObservable();

  @observable
  HomeClientScreenStatus state = HomeClientScreenStatus.loading();

  @observable
  ScreenState listState = ScreenState.idle;

  @observable
  int orderByList = 3;

  @computed
  bool get isLoading => state is ScreenLoading;
  @computed
  bool get hasError => state is ScreenError;
  @computed
  bool get isSuccess => state is ScreenSuccess;

  @observable
  SfRangeValues valuesRange = const SfRangeValues(40.0, 80.0);

  @action
  void addMainList(final List<ServiceForClientEntity> newValue) {
    listProvidersSelected
      ..clear()
      ..addAll(newValue);
  }

  @action
  int setOrderByList(final int newValue) => orderByList = newValue;

  @action
  int setbottomBarIndex(final int newValue) => bottomBarIndex = newValue;

  @action
  SfRangeValues setValuesRange(final SfRangeValues newValue) =>
      valuesRange = newValue;

  @action
  SpecialityEntity setServiceSelected(final SpecialityEntity newValue) =>
      serviceSelected = newValue;

  @action
  int setTabActivityIndex(final int newValue) => tabActivityIndex = newValue;

  final PageController pageController = PageController(initialPage: 1);

  bool isExecutingFunction = false;

  @action
  Future<void> getHomeClient() async {
    state = HomeClientScreenStatus.loading();
    final Result<HomeClientEntity, HttpCoreError> response =
        await MethodHandler.errorState<HomeClientEntity>(service.getHomeClient);

    response.when(
      (success) {
        addMainList(success.lastestSearch);
        state = HomeClientScreenStatus.success(success);
      },
      (error) => state = HomeClientScreenStatus.error(error),
    );
  }

  @action
  Future<void> onClickBottomBar(final int newIndex) async {
    isExecutingFunction = true;
    setbottomBarIndex(newIndex);
    await pageController
        .animateToPage(
          newIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        )
        .then((value) => isExecutingFunction = false);
  }

  @action
  void onPageSlide(final int newIndexPage) {
    if (!isExecutingFunction) {
      setbottomBarIndex(newIndexPage);
    }
  }

  @action
  Future<void> getHomeSearch() async {
    listState = ScreenState.loading;
    final Result<List<ServiceForClientEntity>, HttpCoreError> response =
        await MethodHandler.errorState<List<ServiceForClientEntity>>(
            () => service.getProvidersBySpecialities(serviceSelected!));

    response.when(
      addMainList,
      (error) => state = HomeClientScreenStatus.error(error),
    );
    listState = ScreenState.idle;
  }

  @action
  Future<bool> editProfile(final User newUserEdited) async {
    listState = ScreenState.loading;
    bool hasEditdWorked = false;
    final Result<User, HttpCoreError> response =
        await MethodHandler.errorState<User>(
            () => service.editProfile(newUserEdited));
    response.when(
      (successUser) {
        hasEditdWorked = true;
        saveInfoOnDevice(Authenticate(
            userAuthenticated: successUser,
            refreshToken: _sessionController.session!.refreshToken,
            token: _sessionController.session!.token));
      },
      (error) => hasEditdWorked = false,
    );
    listState = ScreenState.idle;
    return hasEditdWorked;
  }

  Future<void> saveInfoOnDevice(Authenticate authenticate) async {
    _sessionController.setSession(authenticate);
    await _sessionController.saveSessionOnDevice();
  }
}
