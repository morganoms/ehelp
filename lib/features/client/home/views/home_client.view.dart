import 'package:ehelp/features/client/home/views/settings_client.view.dart';
import 'package:ehelp/shared/models/screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../core/locator.dart';
import '../../../../shared/colors/constants.dart';

import '../../../../shared/components/generic_loading.widget.dart';
import '../view_model/home_client.view_model.dart';
import 'activities_client.view.dart';
import 'search_service.view.dart';

class HomeClientView extends StatefulWidget {
  const HomeClientView({Key? key}) : super(key: key);

  @override
  State<HomeClientView> createState() => _HomeClientViewState();
}

class _HomeClientViewState extends State<HomeClientView> {
  late HomeClientViewModel _viewModel;

  @override
  void initState() {
    _viewModel = locator.get<HomeClientViewModel>();
    Future.delayed(const Duration(seconds: 3))
        .then((value) => _viewModel.setState(ScreenState.success));
    super.initState();
  }

  @override
  void dispose() {
    locator.resetLazySingleton<HomeClientViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      return true;
    }, child: Observer(builder: (_) {
      return Scaffold(
        body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _viewModel.isLoading
                ? const GenericLoading()
                : _buildSuccess()),
      );
    }));
  }

  Widget _buildSuccess() => Scaffold(
        bottomNavigationBar: Observer(
          builder: (_) {
            return SalomonBottomBar(
              currentIndex: _viewModel.bottomBarIndex,
              itemPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              selectedItemColor: ColorConstants.blackSoft,
              unselectedItemColor: ColorConstants.primaryLight,
              onTap: (i) => _viewModel.onClickBottomBar(i),
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(Icons.receipt),
                  title: const Text('Atividades'),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text('Página Inicial'),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.settings),
                  title: const Text('Configurações'),
                ),
              ],
            );
          },
        ),
        body: Observer(
          builder: (_) {
            return PageView(
              onPageChanged: (pageIndex) => _viewModel.onPageSlide(pageIndex),
              controller: _viewModel.pageController,
              children: const <Widget>[
                ActivitiesClientView(),
                SearchServiceView(),
                SettingsClientView(),
              ],
            );
          },
        ),
      );
}
