import 'package:ehelp/features/professional/home/views/history_professional.view.dart';
import 'package:ehelp/features/professional/home/views/professional_calls.view.dart';
import 'package:ehelp/features/professional/home/views/settings_professional.view.dart';
import 'package:ehelp/shared/colors/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../locator.dart';
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
            selectedItemColor: ColorConstants.blueSelected,
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
      body: Observer(builder: (_) {
        return PageView(
          onPageChanged: (pageIndex) => _viewModel.onPageSlide(pageIndex),
          controller: _viewModel.pageController,
          children: const <Widget>[
            HistoryProfessionalView(),
            ProfessionalCallsView(),
            SettingsProfesssionalView(),
          ],
        );
      }),
    );
  }
}
