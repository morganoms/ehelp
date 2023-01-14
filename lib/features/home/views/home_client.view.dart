import 'package:ehelp/features/home/views/account_client.view.dart';
import 'package:ehelp/features/home/views/activities_client.view.dart';
import 'package:ehelp/features/home/views/search_service.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../locator.dart';
import '../view_model/home_client.view_model.dart';

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
            selectedItemColor: Colors.grey.shade600,
            onTap: (i) => _viewModel.onClickBottomBar(i),
            items: [
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.receipt,
                  color: Theme.of(context).primaryColor,
                ),
                title: const Text('Atividades'),
              ),
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.home,
                  color: Theme.of(context).primaryColor,
                ),
                title: const Text('Página Inicial'),
              ),
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.person,
                  color: Theme.of(context).primaryColor,
                ),
                title: const Text('Conta'),
              ),
            ],
          );
        },
      ),
      body: Observer(builder: (_) {
        return PageView(
          onPageChanged: (pageIndex) => _viewModel.onPageSlide(pageIndex),
          controller: _viewModel.pageController,
          children: const <Widget>[
            ActivitiesClientView(),
            SearchServiceView(),
            AccaountView(),
          ],
        );
      }),
    );
  }
}
