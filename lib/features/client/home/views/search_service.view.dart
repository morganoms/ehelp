import 'dart:math';

import 'package:ehelp/shared/components/dropdown_search.widget.dart';
import 'package:ehelp/shared/components/generic_button.widget.dart';
import 'package:ehelp/shared/components/header_background.widget.dart';
import 'package:ehelp/shared/components/header_black.widget.dart';
import 'package:ehelp/shared/fonts/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../core/locator.dart';
import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/default_dialog.widget.dart';
import '../../../../shared/components/person_picture.widget.dart';
import '../view_model/home_client.view_model.dart';
import 'components/adress_dialog.widget.dart';
import 'components/service_item.widget.dart';

class SearchServiceView extends StatefulWidget {
  const SearchServiceView({Key? key}) : super(key: key);

  @override
  State<SearchServiceView> createState() => _SearchServiceViewState();
}

class _SearchServiceViewState extends State<SearchServiceView> {
  late HomeClientViewModel _controller;

  @override
  void initState() {
    _controller = locator.get<HomeClientViewModel>();
    super.initState();
  }

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
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void _showFilter() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        builder: (BuildContext bc) {
          return Container(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.shade300,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Filtros',
                    style: FontStyles.size20Weight700,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Ordenar por:',
                    style: FontStyles.size16Weight400,
                  ),
                ),
                const SizedBox(height: 16),
                SegmentedButton(
                  style: ButtonStyle(
                    side: const MaterialStatePropertyAll<BorderSide>(BorderSide(
                      color: Color.fromARGB(255, 211, 211, 211),
                    )),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return ColorConstants.greenDark;
                        }
                        return Colors.white;
                      },
                    ),
                    foregroundColor: const MaterialStatePropertyAll<Color>(
                      Colors.black,
                    ),
                  ),
                  segments: const [
                    ButtonSegment(
                      value: '1',
                      label: Text('Valor'),
                    ),
                    ButtonSegment(
                      value: '2',
                      label: Text('Avaliações'),
                    ),
                    ButtonSegment(
                      value: '3',
                      label: Text('Qtd. de Serviços'),
                    )
                  ],
                  selected: const <String>{'1'},
                  onSelectionChanged: (Set<String> p0) {},
                ),
                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Valor do Seviço',
                    style: FontStyles.size16Weight400,
                  ),
                ),
                Observer(builder: (_) {
                  return SfRangeSlider(
                    min: 0.0,
                    max: 100.0,
                    values: _controller.valuesRange,
                    interval: 100.0,
                    showLabels: true,
                    enableTooltip: true,
                    activeColor: ColorConstants.greenDark,
                    onChanged: (SfRangeValues values) {
                      setState(() {
                        _controller.setValuesRange(values);
                      });
                    },
                  );
                }),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderBlack(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const PersonPicture(),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Olá, Morgan!',
                                  style: FontStyles.size16Weight700White,
                                ),
                                Text(
                                  'Cliente',
                                  style: FontStyles.size14Weight400white,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Observer(builder: (_) {
                        return Visibility(
                          visible: _controller.serviceSelected.isNotEmpty,
                          child: Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: ColorConstants.greenStrong),
                              child: IconButton(
                                onPressed: _showFilter,
                                icon: const Icon(
                                  Icons.filter_list,
                                  color: ColorConstants.blackSoft,
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(builder: (_) {
                    return Row(
                      children: [
                        Flexible(
                          flex: 8,
                          child: DropdownSearch2Widget(
                            items: items,
                            textEditingController: textEditingController,
                            initValue: _controller.serviceSelected,
                            hintText: 'Procurar Serviços',
                            onChanged: (final newValue) {
                              _controller
                                  .setServiceSelected(newValue as String);
                            },
                          ),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(builder: (_) {
                  return Visibility(
                    visible: _controller.serviceSelected.isEmpty,
                    replacement: Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Resultados encontrados: 10',
                          style: FontStyles.size16Weight700),
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Pesquisas Recentes',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 16,
                ),
                Flexible(
                  child: Column(
                    children: [
                      ...List.generate(
                        10,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ServiceItemWidget(
                            indexImage: index % 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
