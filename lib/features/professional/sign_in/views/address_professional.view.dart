import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ehelp/core/dto_validations.dart';
import 'package:ehelp/core/locator.dart';
import 'package:ehelp/features/client/home/model/entity/address_client.dart';
import 'package:ehelp/features/client/home/view_model/controllers/address_client.view_model.dart';
import 'package:ehelp/shared/colors/constants.dart';
import 'package:ehelp/shared/components/back_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/header_black.widget.dart';
import '../../../../shared/components/stepper.widget.dart';
import '../../../../shared/fonts/styles.dart';
import '../../../client/home/view_model/screen_state/address_client.scree_state.dart';
import 'components/form_address.widget.dart';

class AdressProfessionalView extends StatefulWidget {
  const AdressProfessionalView({required this.adressClient, Key? key})
      : super(key: key);

  final Map<String, dynamic> adressClient;

  @override
  State<AdressProfessionalView> createState() => _AdressProfessionalViewState();
}

class _AdressProfessionalViewState extends State<AdressProfessionalView> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> addressScheme;
  late AdressClientViewModel _viewModel;
  bool isEditing = false;

  @override
  void initState() {
    _viewModel = locator.get<AdressClientViewModel>();
    addressScheme = widget.adressClient;
    isEditing = addressScheme['userId'] != null;

    super.initState();
  }

  Future<void> onEditingConfirm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final bool result = await _viewModel.editAddress(
          DtoValidation.dynamicToObject(
              addressScheme, AdressClientDto.fromJson));

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: Observer(builder: (_) {
          return GenericButton(
            label: 'Continuar',
            loading: _viewModel.state is ScreenLoading,
            color: ColorConstants.greenDark,
            onPressed: () => isEditing
                ? onEditingConfirm()
                : Navigator.of(context).pushNamed(
                    EhelpRoutes.bankingProfessional,
                    arguments: false),
          );
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderBlack(
              titleLable: isEditing ? 'Endereço' : 'Cadastro de Profissional',
              iconBack: BackButtonWidget(),
              child: isEditing
                  ? null
                  : Container(
                      color: ColorConstants.blackSoft,
                      padding: const EdgeInsets.only(
                          bottom: 16, left: 24, right: 14),
                      child: const StepperWidget(
                          totalSteps: 4, totalActiveSteps: 2),
                    ),
            ),
            SingleChildScrollView(
              child: Padding(
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
