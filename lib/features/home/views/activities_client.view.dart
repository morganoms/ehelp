import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../locator.dart';
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
      return Flexible(child: BookedServicesWidegt());
    } else {
      return Flexible(child: HistoryServicesWidget());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 24),
                height: 36,
                child: Image.asset(
                  'assets/images/ehelp.png',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 32,
              ),
              TabBar(
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor:
                    Theme.of(context).primaryColor.withOpacity(0.5),
                indicatorColor: Colors.transparent,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                controller: _tabController,
                onTap: (value) => _viewModel.setTabActivityIndex(value),
                tabs: const [
                  Text(
                    'Agendados',
                  ),
                  Text(
                    'Histórico',
                  ),
                ],
              ),
              Container(
                height: 16,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: -5,
                    blurRadius: 10,
                    offset: const Offset(0, 8),
                  ),
                ]),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Observer(builder: (_) {
            return _tabsContent();
          }),
        ],
      ),
    );
  }
}
