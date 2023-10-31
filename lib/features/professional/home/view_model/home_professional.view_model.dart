import 'package:ehelp/features/professional/home/model/service/home_professional/home_professional.service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_professional.view_model.g.dart';

class HomeProfessionalViewModel = HomeProfessionalViewModelBase
    with _$HomeProfessionalViewModel;

abstract class HomeProfessionalViewModelBase with Store {
  HomeProfessionalViewModelBase(this.service);

  final HomeProfessionalService service;
  @observable
  int bottomBarIndex = 1;
  @observable
  int tabActivityIndex = 0;
  @observable
  String serviceSelected = '';
  @observable
  bool isAvaliableNow = false;
  @observable
  bool showCallNow = false;
  @observable
  bool loadingAvaliable = false;

  @action
  Future<bool> setAvaliableNow(final int userId) async {
    loadingAvaliable = true;
    try {
      final statusId = isAvaliableNow ? 10 : 11;
      await service.setAvaliable(statusId: statusId, userId: userId);
      isAvaliableNow = !isAvaliableNow;
      loadingAvaliable = false;
    } catch (e) {
      loadingAvaliable = false;
    }
    return isAvaliableNow;
  }

  @action
  int setbottomBarIndex(final int newValue) => bottomBarIndex = newValue;

  @action
  String setServiceSelected(final String newValue) =>
      serviceSelected = newValue;

  @action
  int setTabActivityIndex(final int newValue) => tabActivityIndex = newValue;

  final PageController pageController = PageController(initialPage: 1);

  bool isExecutingFunction = false;

  @action
  // ignore: avoid_void_async
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
