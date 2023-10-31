import 'package:ehelp/core/locator.dart';
import 'package:ehelp/features/client/home/model/entity/address_client.dart';
import 'package:ehelp/features/client/home/view_model/controllers/address_client.view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/session/session.controller.dart';
import '../../../../../routes/ehelp_routes.dart';
import '../../../../../shared/Colors/constants.dart';
import '../../../../../shared/components/back_button.widget.dart';
import '../../../../../shared/components/empty.widget.dart';
import '../../../../../shared/components/generic_button.widget.dart';
import '../../../../../shared/components/generic_error.widget.dart';
import '../../../../../shared/components/generic_loading.widget.dart';
import '../../../../../shared/components/header_black.widget.dart';
import '../../../../../shared/entity/user/user.entity.dart';
import '../../../../../shared/fonts/styles.dart';
import '../../view_model/screen_state/address_client.scree_state.dart';
import 'address_card.widget.dart';

class AdressesClientView extends StatefulWidget {
  const AdressesClientView({Key? key}) : super(key: key);

  @override
  State<AdressesClientView> createState() => _AdressesClientViewState();
}

class _AdressesClientViewState extends State<AdressesClientView> {
  late AdressClientViewModel _viewModel;
  late User _user;

  @override
  void initState() {
    _viewModel = locator.get<AdressClientViewModel>();
    _user = locator.get<SessionController>().session!.userAuthenticated;
    WidgetsBinding.instance.addPostFrameCallback((final _) async => loadData());
    super.initState();
  }

  void loadData() => _viewModel.getAdresses(_user.id);

  @override
  void dispose() {
    locator.resetLazySingleton<AdressClientViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      return true;
    }, child: Observer(builder: (_) {
      if (_viewModel.state is ScreenError) {
        return GenericError(
            requestError: (_viewModel.state as ScreenError).requestError);
      } else if (_viewModel.state is ScreenLoading) {
        return const GenericLoading();
      } else {
        return _buildSuccess(context);
      }
    }));
  }

  Widget _buildSuccess(final BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          label: 'Adicionar novo endereço',
          color: Colors.transparent,
          labelStyle: FontStyles.size16Weight500blue,
          borderColor: ColorConstants.primaryLight,
          onPressed: () => Navigator.of(context).pushReplacementNamed(
              EhelpRoutes.addressClient,
              arguments: AdressClient.toEmptyJson()),
        ),
      ),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: HeaderBlack(
              titleLable: 'Endereços',
              iconBack: BackButtonWidget(),
            ),
          ),
          SliverToBoxAdapter(
            child: Observer(builder: (_) {
              return Visibility(
                visible: _viewModel.addressList.isNotEmpty,
                replacement: const EmptyWidget(
                    subtitle: 'Nenhum endereço foi encontrado.'),
                child: Column(
                  children: _viewModel.addressList
                      .map((element) => AddressClientCardWidget(
                          isChile: element.countryId == 1,
                          address: element,
                          onRemoveAddress: () async =>
                              _viewModel.removeAddress(element.id!, _user.id)))
                      .toList(),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
