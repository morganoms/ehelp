import 'package:ehelp/shared/components/input_dropdown.widget.dart';
import 'package:flutter/material.dart';

import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/input.widget.dart';
import '../../../../shared/components/stepper.widget.dart';
import '../../../../shared/fonts/styles.dart';

class BankingProfessionalView extends StatefulWidget {
  const BankingProfessionalView({Key? key}) : super(key: key);

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
          label: 'Continuar',
          onPressed: () => Navigator.of(context).pushNamed(
            EhelpRoutes.homeArea,
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 18,
                        ),
                      ),
                    ),
                    Text(
                      'Cadastro de Profissional',
                      style: FontStyles.size16Weight700,
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const StepperWidget(totalSteps: 4, totalActiveSteps: 3),
                const SizedBox(
                  height: 48,
                ),
                Text(
                  'Informe seus dados bancários:',
                  style: FontStyles.size14Weight400,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Input(label: Text('Banco')),
                      const SizedBox(
                        height: 16,
                      ),
                      const Input(label: Text('Agência')),
                      const SizedBox(
                        height: 16,
                      ),
                      const Input(label: Text('Conta')),
                      const SizedBox(
                        height: 16,
                      ),
                      InputDropdown(items: const [
                        'Conta Corrente',
                        'Conta Salário',
                        'Conta Poupança'
                      ], hintText: 'Tipo de Conta', onChanged: (final _) {})
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
