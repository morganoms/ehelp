import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_professional.view_model.g.dart';

class HomeProfessionalViewModel = _HomeProfessionalViewModelBase
    with _$HomeProfessionalViewModel;

abstract class _HomeProfessionalViewModelBase with Store {
  @observable
  int bottomBarIndex = 1;
  @observable
  int tabActivityIndex = 0;
  @observable
  String serviceSelected = '';
  @observable
  bool isAvaliableNow = false;

  @action
  bool setAvaliableNow(final bool newValue) => isAvaliableNow = newValue;

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
