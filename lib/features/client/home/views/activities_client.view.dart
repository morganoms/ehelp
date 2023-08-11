import 'package:ehelp/shared/colors/constants.dart';
import 'package:ehelp/shared/components/header_black.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/locator.dart';
import '../model/entity/home_client.entity.dart';
import '../view_model/controllers/home_client.view_model.dart';
import 'components/tabs/booked_services.widget.dart';
import 'components/tabs/history_services.widget.dart';

class ActivitiesClientView extends StatefulWidget {
  const ActivitiesClientView({required this.screenData, Key? key})
      : super(key: key);

  final HomeClientEntity screenData;

  @override
  State<ActivitiesClientView> createState() => _ActivitiesClientViewState();
}

class _ActivitiesClientViewState extends State<ActivitiesClientView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late HomeClientViewModel _viewModel;
  late HomeClientEntity _screenData;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _screenData = widget.screenData;
    _viewModel = locator.get<HomeClientViewModel>();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabControllerTick);
  }

  void _handleTabControllerTick() {}

  Widget _tabsContent() {
    if (_viewModel.tabActivityIndex == 0) {
      return BookedServicesWidegt(screenData: _screenData.bookedHistory);
    } else {
      return HistoryServicesWidget(screenData: _screenData.serviceHistory);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderBlack(
          titleLable: 'Atividades',
          child: Observer(builder: (_) {
            return Container(
              color: ColorConstants.blackSoft,
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: ColorConstants.primaryColor),
                child: TabBar(
                  labelColor: ColorConstants.blackSoft,
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
                        style: TextStyle(color: Colors.white),
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
                            color: ColorConstants.greenStrong),
                        child: const Text(
                          'Agendados',
                        ),
                      ),
                    ),
                    Visibility(
                      replacement: const Text(
                        'Histórico',
                        style: TextStyle(color: Colors.white),
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
                            color: ColorConstants.greenStrong),
                        child: const Text(
                          'Histórico',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
