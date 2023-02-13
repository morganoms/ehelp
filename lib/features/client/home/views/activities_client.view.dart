import 'package:ehelp/shared/colors/constants.dart';
import 'package:ehelp/shared/components/header_background.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../locator.dart';
import '../../../../shared/fonts/styles.dart';
import '../view_model/home_client.view_model.dart';
import 'components/tabs/booked_services.widget.dart';
import 'components/tabs/history_services.widget.dart';

class ActivitiesClientView extends StatefulWidget {
  const ActivitiesClientView({Key? key}) : super(key: key);

  @override
  State<ActivitiesClientView> createState() => _ActivitiesClientViewState();
}

class _ActivitiesClientViewState extends State<ActivitiesClientView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late HomeClientViewModel _viewModel;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _viewModel = locator.get<HomeClientViewModel>();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabControllerTick);
  }

  void _handleTabControllerTick() {}

  Widget _tabsContent() {
    if (_viewModel.tabActivityIndex == 0) {
      return const BookedServicesWidegt();
    } else {
      return const HistoryServicesWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HeaderBackground(),
        SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Atividades',
                    style: FontStyles.size20Weight400,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Observer(builder: (_) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: ColorConstants.primaryV2),
                      child: TabBar(
                        labelColor: ColorConstants.blueSelected,
                        unselectedLabelColor:
                            Theme.of(context).primaryColor.withOpacity(0.5),
                        indicatorColor: Colors.transparent,
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        controller: _tabController,
                        onTap: (value) => _viewModel.setTabActivityIndex(value),
                        tabs: [
                          Visibility(
                            replacement: const Text(
                              'Agendados',
                            ),
                            visible: _viewModel.tabActivityIndex == 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: -5,
                                      blurRadius: 10,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white),
                              child: const Text(
                                'Agendados',
                              ),
                            ),
                          ),
                          Visibility(
                            replacement: const Text(
                              'Histórico',
                            ),
                            visible: _viewModel.tabActivityIndex == 1,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: -5,
                                      blurRadius: 10,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white),
                              child: const Text(
                                'Histórico',
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Observer(builder: (_) {
                return Flexible(child: _tabsContent());
              }),
            ],
          ),
        ),
      ],
    );
  }
}
