import 'package:ehelp/core/default_exception.dart';
import 'package:ehelp/features/client/home/model/entity/home_client.entity.dart';
import 'package:ehelp/features/client/home/model/service/home_client.service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../core/http/http_core_error.dart';
import '../../../../../shared/entity/speciality.entity.dart';
import '../../views/components/service_item.widget.dart';
import '../screen_state/home_client.screen_state.dart';
part 'home_client.view_model.g.dart';

class HomeClientViewModel = HomeClientViewModelBase with _$HomeClientViewModel;

abstract class HomeClientViewModelBase with Store {
  HomeClientViewModelBase(this.service);

  final HomeClientService service;

  @observable
  int bottomBarIndex = 1;
  @observable
  int tabActivityIndex = 0;
  @observable
  SpecialityEntity? serviceSelected;
  @observable
  HomeClientScreenStatus state = HomeClientScreenStatus.loading();

  @observable
  int orderByList = 3;

  @computed
  bool get isLoading => state is Loading;
  @computed
  bool get hasError => state is Error;
  @computed
  bool get isSuccess => state is Success;

  @observable
  SfRangeValues valuesRange = const SfRangeValues(40.0, 80.0);

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

  @action
  List<Widget> buildListServics(final HomeClientEntity screenData) {
    return screenData.lastestSearch
        .map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ServiceItemWidget(
              indexImage: 4,
              cardData: e,
            ),
          ),
        )
        .toList();
  }

  final PageController pageController = PageController(initialPage: 1);

  bool isExecutingFunction = false;

  @action
  Future<void> getHomeClient() async {
    state = HomeClientScreenStatus.loading();
    try {
      final HomeClientEntity response = await service.getHomeClient();
      state = HomeClientScreenStatus.success(response);
    } on HttpCoreError catch (e) {
      state = HomeClientScreenStatus.error(e);
    } on Exception catch (_) {
      state = HomeClientScreenStatus.error(defaultException);
    }
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
}
