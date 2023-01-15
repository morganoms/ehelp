import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/stepper.widget.dart';
import '../../../../shared/fonts/styles.dart';
import 'components/form_personal_data.widget.dart';

class ProfessionalPersonalDataView extends StatefulWidget {
  const ProfessionalPersonalDataView({Key? key}) : super(key: key);

  @override
  State<ProfessionalPersonalDataView> createState() =>
      _ProfessionalPersonalDataViewState();
}

class _ProfessionalPersonalDataViewState
    extends State<ProfessionalPersonalDataView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          label: 'Continuar',
          onPressed: () =>
              Navigator.of(context).pushNamed(EhelpRoutes.addressProfessional),
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
                const StepperWidget(totalSteps: 4, totalActiveSteps: 1),
                const SizedBox(
                  height: 48,
                ),
                Text(
                  'Forneça uma foto sua, e alguns dados pessoais:',
                  style: FontStyles.size14Weight400,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  margin: const EdgeInsets.only(top: 24),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFF575757),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: SizedBox.expand(
                      child: FittedBox(
                        child: Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                FormPersonalDataWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
