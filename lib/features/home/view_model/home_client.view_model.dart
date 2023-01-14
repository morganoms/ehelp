import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_client.view_model.g.dart';

class HomeClientViewModel = _HomeClientViewModelBase with _$HomeClientViewModel;

abstract class _HomeClientViewModelBase with Store {
  @observable
  int bottomBarIndex = 1;
  @observable
  int tabActivityIndex = 0;
  @observable
  String serviceSelected = '';

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
