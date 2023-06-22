import 'package:ehelp/shared/colors/constants.dart';
import 'package:ehelp/shared/components/back_button.widget.dart';
import 'package:flutter/material.dart';

import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/header_black.widget.dart';
import '../../../../shared/components/random_person_image.widget.dart';
import '../../../../shared/components/stepper.widget.dart';
import '../../../../shared/fonts/styles.dart';
import 'components/form_personal_data.widget.dart';

class ProfessionalPersonalDataView extends StatefulWidget {
  const ProfessionalPersonalDataView({this.isEditing = false, final Key? key})
      : super(key: key);

  final bool isEditing;

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
          color: ColorConstants.greenDark,
          label: widget.isEditing ? 'Salvar' : 'Continuar',
          onPressed: () => widget.isEditing
              ? Navigator.of(context).pop()
              : Navigator.of(context)
                  .pushNamed(EhelpRoutes.addressProfessional, arguments: false),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderBlack(
              titleLable: widget.isEditing
                  ? 'Dados pessoais'
                  : 'Cadastro de Profissional',
              iconBack: const BackButtonWidget(),
              child: widget.isEditing
                  ? null
                  : Container(
                      color: ColorConstants.blackSoft,
                      padding: const EdgeInsets.only(
                          bottom: 16, left: 24, right: 14),
                      child: const StepperWidget(
                          totalSteps: 4, totalActiveSteps: 1),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  if (!widget.isEditing)
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Forneça alguns dados pessoais:',
                        style: FontStyles.size16Weight700,
                      ),
                    ),
                  if (widget.isEditing)
                    const RandomPersonImage(
                      heightImage: 150,
                      widthtImage: 150,
                      marginRight: false,
                    )
                  else
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
                  FormPersonalDataWidget(isEditing: widget.isEditing),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
