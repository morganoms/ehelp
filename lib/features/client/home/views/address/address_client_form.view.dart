import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ehelp/core/dto_validations.dart';
import 'package:ehelp/core/locator.dart';
import 'package:ehelp/core/session/session.controller.dart';
import 'package:ehelp/features/client/home/model/entity/address_client.dart';
import 'package:ehelp/features/client/home/view_model/controllers/address_client.view_model.dart';
import 'package:ehelp/shared/colors/constants.dart';
import 'package:ehelp/shared/components/back_button.widget.dart';
import 'package:ehelp/shared/entity/user/user.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../routes/ehelp_routes.dart';
import '../../../../../shared/components/generic_button.widget.dart';
import '../../../../../shared/components/generic_error.widget.dart';
import '../../../../../shared/components/generic_loading.widget.dart';
import '../../../../../shared/components/header_black.widget.dart';
import '../../../../../shared/fonts/styles.dart';
import '../../view_model/screen_state/address_client.scree_state.dart';
import 'form_address.widget.dart';

class AdressClientFormView extends StatefulWidget {
  const AdressClientFormView({required this.adressClient, Key? key})
      : super(key: key);

  final Map<String, dynamic> adressClient;

  @override
  State<AdressClientFormView> createState() => _AdressClientFormViewState();
}

class _AdressClientFormViewState extends State<AdressClientFormView> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> addressScheme;
  late AdressClientViewModel _viewModel;
  late User _user;
  bool isEditing = false;

  @override
  void initState() {
    _viewModel = locator.get<AdressClientViewModel>();

    addressScheme = widget.adressClient;
    isEditing = addressScheme['userId'] != null;
    if (isEditing) {
      addressScheme['isChile'] = addressScheme['countryId'] == 1;
    }

    WidgetsBinding.instance.addPostFrameCallback((final _) async => loadData());
    super.initState();
  }

  Future<void> loadData() async {
    await _viewModel.getCountries();

    if (isEditing) {
      await _viewModel.getStates(addressScheme['countryId']);
      await _viewModel.getCities(
        isChile: addressScheme['isChile'],
        regionId: addressScheme['regionId'],
        stateId: addressScheme['stateId'],
      );
    }
  }

  Future<void> onSaveForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      bool result = false;
      if (isEditing) {
        result = await _viewModel.editAddress(DtoValidation.dynamicToObject(
            addressScheme, AdressClientDto.fromJson));
      } else {
        _user = locator.get<SessionController>().session!.userAuthenticated;
        addressScheme['userId'] = _user.id;
        addressScheme.remove('id');
        result = await _viewModel.newAddress(DtoValidation.dynamicToObject(
            addressScheme, AdressClientDto.fromJson));
      }

      await AwesomeDialog(
        context: context,
        dialogType: result ? DialogType.success : DialogType.error,
        headerAnimationLoop: false,
        animType: AnimType.rightSlide,
        title: result ? 'Tudo certo!' : 'Oops!',
        desc: result
            ? 'Seu endereço atualizado com sucesso'
            : 'Ocorreu algum erro al salvar seu endereço. Por favor, tente novamente.',
      ).show();
    }
  }

  void onBack() =>
      Navigator.of(context).pushReplacementNamed(EhelpRoutes.clientAdresses);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      onBack();
      return true;
    }, child: Observer(builder: (_) {
      if (_viewModel.stateForm is ScreenError) {
        return GenericError(
            requestError: (_viewModel.stateForm as ScreenError).requestError);
      } else if (_viewModel.stateForm is ScreenLoading) {
        return const GenericLoading();
      } else {
        return _buildSuccess(context);
      }
    }));
  }

  Widget _buildSuccess(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: Observer(builder: (_) {
          return GenericButton(
            label: 'Continuar',
            loading: _viewModel.state is ScreenLoading,
            color: ColorConstants.greenDark,
            onPressed: onSaveForm,
          );
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderBlack(
              titleLable:
                  isEditing ? 'Edição do Endereço' : 'Cadastro de Endereço',
              iconBack: BackButtonWidget(onTap: onBack),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Forneça o endereço da sua oficina ou residência:',
                    style: FontStyles.size14Weight400,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  FormAddressWidget(
                    addressFormValue: addressScheme,
                    formKey: _formKey,
                    viewModel: _viewModel,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
