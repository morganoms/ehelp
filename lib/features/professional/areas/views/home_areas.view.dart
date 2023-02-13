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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          color: ColorConstants.blueSelected,
          label: 'Solicitar Aprovação',
          onPressed: () {},
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
                            widget.isEditing
                                ? 'Editar Especialidade'
                                : 'Cadastro de Profissional',
                            style: FontStyles.size18Weight500,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      if (!widget.isEditing)
                        const StepperWidget(totalSteps: 4, totalActiveSteps: 4),
                      const SizedBox(height: 24),
                      if (!widget.isEditing)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Selecione os segmentos de serviços em que você atua:',
                            style: FontStyles.size16Weight700,
                          ),
                        ),
                      const SizedBox(
                        height: 16,
                      ),
                      Observer(builder: (_) {
                        return DropdownSearch2Widget(
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
                            });
                      }),
                      const SizedBox(
                        height: 32,
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
                                            onPressed: () =>
                                                Navigator.of(context).pushNamed(
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
            ),
          ],
        ),
      ),
    );
  }
}
