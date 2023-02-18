import 'package:ehelp/features/professional/areas/models/service_area.entity.dart';
import 'package:ehelp/features/professional/areas/view_model/home_area.view_model.dart';
import 'package:ehelp/shared/components/back_button.widget.dart';
import 'package:ehelp/shared/components/dropdown_search.widget.dart';
import 'package:ehelp/shared/components/header_background.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../locator.dart';
import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/components/header_black.widget.dart';
import '../../../../shared/components/stepper.widget.dart';
import '../../../../shared/fonts/styles.dart';

class HomeAreaView extends StatefulWidget {
  const HomeAreaView({this.isEditing = false, Key? key}) : super(key: key);

  final bool isEditing;

  @override
  State<HomeAreaView> createState() => _HomeAreaViewState();
}

class _HomeAreaViewState extends State<HomeAreaView> {
  late HomeAreaViewModel _controller;

  final List<String> items = [
    'Eletricista',
    'Mecânico',
    'Pedreiro',
    'Encanador',
    'Cabelereiro',
    'Barbeiro',
    'Manicure',
    'Maquiadora',
  ];

  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    _controller = locator.get<HomeAreaViewModel>();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteBackground,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          color: ColorConstants.greenDark,
          label: 'Solicitar Aprovação',
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderBlack(
              titleLable: widget.isEditing
                  ? 'Editar Especialidade'
                  : 'Cadastro de Profissional',
              iconBack: const BackButtonWidget(),
              child: Observer(builder: (_) {
                return Container(
                  color: ColorConstants.blackSoft,
                  padding:
                      const EdgeInsets.only(left: 24, bottom: 16, right: 24),
                  child: DropdownSearch2Widget(
                      items: items,
                      textEditingController: textEditingController,
                      initValue: _controller.serviceSelected,
                      hintText: 'Serviços...',
                      onChanged: (final newValue) {
                        _controller
                          ..setServiceSelected(newValue as String)
                          ..addAreaToList(
                            ServiceAreaEntity(
                              nameArea: newValue,
                              weekDays: [],
                              workingHours: [],
                              paymentValue: 0,
                            ),
                          );
                      }),
                );
              }),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    if (!widget.isEditing)
                      const Padding(
                          padding: EdgeInsets.only(bottom: 24),
                          child: StepperWidget(
                              totalSteps: 4, totalActiveSteps: 4)),
                    if (!widget.isEditing)
                      Container(
                        margin: const EdgeInsets.only(bottom: 32),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Selecione os segmentos de serviços em que você atua:',
                          style: FontStyles.size16Weight700,
                        ),
                      ),
                    Observer(builder: (_) {
                      return Column(
                        children: _controller.areasList
                            .map(
                              (element) => Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: -5,
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 24),
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      element.nameArea,
                                      style: FontStyles.size16Weight700,
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () => Navigator.of(context)
                                              .pushNamed(
                                                  EhelpRoutes.homeEditArea),
                                          icon: const Icon(Icons.edit),
                                        ),
                                        IconButton(
                                          onPressed: () => _controller
                                              .removeAreaToList(element),
                                          icon: const Icon(Icons.delete),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      );
                    })
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
