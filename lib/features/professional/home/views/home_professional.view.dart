import 'package:ehelp/features/professional/home/views/professional_calls.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../locator.dart';
import '../../../home/views/account_client.view.dart';
import '../../../home/views/activities_client.view.dart';
import '../view_model/home_professional.view_model.dart';

class HomeProfessionalView extends StatefulWidget {
  const HomeProfessionalView({Key? key}) : super(key: key);

  @override
  State<HomeProfessionalView> createState() => _HomeProfessionalViewState();
}

class _HomeProfessionalViewState extends State<HomeProfessionalView> {
  late HomeProfessionalViewModel _viewModel;

  @override
  void initState() {
    _viewModel = locator.get<HomeProfessionalViewModel>();
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
            ProfessionalCallsView(),
            AccaountView(),
          ],
        );
      }),
    );
  }
}
