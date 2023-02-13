import 'package:ehelp/shared/components/back_button.widget.dart';
import 'package:ehelp/shared/components/header_background.widget.dart';
import 'package:flutter/material.dart';

import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/input.widget.dart';
import '../../../../shared/components/stepper.widget.dart';
import '../../../../shared/fonts/styles.dart';

class AdressProfessionalView extends StatefulWidget {
  const AdressProfessionalView({Key? key}) : super(key: key);

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
          onPressed: () => Navigator.of(context)
              .pushNamed(EhelpRoutes.bankingProfessional, arguments: false),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const HeaderBackground(),
            SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const BackButtonWidget(),
                          const SizedBox(width: 16),
                          Text(
                            'Cadastro de Profissional',
                            style: FontStyles.size18Weight500,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const StepperWidget(totalSteps: 4, totalActiveSteps: 2),
                      const SizedBox(height: 24),
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
            ),
          ],
        ),
      ),
    );
  }
}
