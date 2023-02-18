import 'package:ehelp/features/client/home/views/settings_client.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../locator.dart';
import '../../../../shared/colors/constants.dart';

import '../view_model/home_client.view_model.dart';
import 'account_client.view.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
}
