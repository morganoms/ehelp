import 'package:ehelp/shared/components/back_button.widget.dart';
import 'package:ehelp/shared/components/header_background.widget.dart';
import 'package:ehelp/shared/components/input_dropdown.widget.dart';
import 'package:flutter/material.dart';

import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/input.widget.dart';
import '../../../../shared/components/stepper.widget.dart';
import '../../../../shared/fonts/styles.dart';

class BankingProfessionalView extends StatefulWidget {
  const BankingProfessionalView({this.isEditing = false, Key? key})
      : super(key: key);
  final bool isEditing;

  @override
  State<BankingProfessionalView> createState() =>
      _BankingProfessionalViewState();
}

class _BankingProfessionalViewState extends State<BankingProfessionalView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          color: ColorConstants.blueSelected,
          label: widget.isEditing ? 'Salvar' : 'Continuar',
          onPressed: () => widget.isEditing
              ? Navigator.of(context).pop()
              : Navigator.of(context)
                  .pushNamed(EhelpRoutes.homeArea, arguments: false),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const HeaderBackground(),
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const BackButtonWidget(),
                        const SizedBox(width: 16),
                        Text(
                          widget.isEditing
                              ? 'Dados bancários'
                              : 'Cadastro de Profissional',
                          style: FontStyles.size16Weight700,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (!widget.isEditing)
                      const StepperWidget(totalSteps: 4, totalActiveSteps: 3),
                    const SizedBox(height: 24),
                    if (!widget.isEditing)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Informe seus dados bancários:',
                          style: FontStyles.size16Weight700,
                        ),
                      ),
                    const SizedBox(
                      height: 16,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Input(
                              label: const Text('Banco'),
                              initialValue:
                                  widget.isEditing ? 'Banco do Brasil' : null),
                          const SizedBox(
                            height: 16,
                          ),
                          Input(
                              label: const Text('Agência'),
                              initialValue: widget.isEditing ? '7878-X' : null),
                          const SizedBox(
                            height: 16,
                          ),
                          Input(
                              label: const Text('Conta'),
                              initialValue:
                                  widget.isEditing ? '10.101-2' : null),
                          const SizedBox(
                            height: 16,
                          ),
                          InputDropdown(
                              value: widget.isEditing ? 'Conta Corrente' : null,
                              items: const [
                                'Conta Corrente',
                                'Conta Salário',
                                'Conta Poupança'
                              ],
                              hintText: 'Tipo de Conta',
                              onChanged: (final _) {})
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
