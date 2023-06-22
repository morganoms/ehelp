import 'package:ehelp/features/professional/home/views/history_professional.view.dart';
import 'package:ehelp/features/professional/home/views/professional_calls.view.dart';
import 'package:ehelp/features/professional/home/views/settings_professional.view.dart';
import 'package:ehelp/shared/colors/constants.dart';
import 'package:ehelp/shared/fonts/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../core/locator.dart';
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
      backgroundColor: ColorConstants.whiteBackground,
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
                icon: const Icon(
                  Icons.receipt,
                ),
                title: Text(
                  'Atividades',
                  style: FontStyles.size14Weight700,
                ),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title:
                    Text('Página Inicial', style: FontStyles.size14Weight700),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.settings),
                title: Text(
                  'Configurações',
                  style: FontStyles.size14Weight700,
                ),
              ),
            ],
          );
        },
      ),
      body: Observer(builder: (_) {
        return PageView(
          onPageChanged: (pageIndex) => _viewModel.onPageSlide(pageIndex),
          controller: _viewModel.pageController,
          children: <Widget>[
            const HistoryProfessionalView(),
            const ProfessionalCallsView(),
            SettingsProfesssionalView(),
          ],
        );
      }),
    );
  }
}
