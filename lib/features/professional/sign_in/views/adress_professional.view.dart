import 'package:ehelp/shared/colors/constants.dart';
import 'package:ehelp/shared/components/back_button.widget.dart';
import 'package:flutter/material.dart';

import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/header_black.widget.dart';
import '../../../../shared/components/input.widget.dart';
import '../../../../shared/components/stepper.widget.dart';
import '../../../../shared/fonts/styles.dart';

class AdressProfessionalView extends StatefulWidget {
  const AdressProfessionalView({this.isEditing = false, Key? key})
      : super(key: key);

  final bool isEditing;

  @override
  State<AdressProfessionalView> createState() => _AdressProfessionalViewState();
}

class _AdressProfessionalViewState extends State<AdressProfessionalView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          label: 'Continuar',
          color: ColorConstants.greenDark,
          onPressed: () => widget.isEditing
              ? Navigator.of(context).pop()
              : Navigator.of(context)
                  .pushNamed(EhelpRoutes.bankingProfessional, arguments: false),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderBlack(
              titleLable:
                  widget.isEditing ? 'Endereço' : 'Cadastro de Profissional',
              iconBack: const BackButtonWidget(),
              child: widget.isEditing
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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: const [
                          Input(label: Text('CEP')),
                          SizedBox(
                            height: 16,
                          ),
                          Input(label: Text('Endereço')),
                          SizedBox(
                            height: 16,
                          ),
                          Input(label: Text('Número')),
                          SizedBox(
                            height: 16,
                          ),
                          Input(label: Text('Complemento')),
                          SizedBox(
                            height: 16,
                          ),
                          Input(label: Text('Bairro')),
                          SizedBox(
                            height: 16,
                          ),
                          Input(label: Text('Estado')),
                          SizedBox(
                            height: 16,
                          ),
                          Input(label: Text('Estado')),
                          SizedBox(
                            height: 36,
                          ),
                        ],
                      ),
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
