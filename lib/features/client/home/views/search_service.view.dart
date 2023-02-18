import 'dart:math';

import 'package:ehelp/shared/components/dropdown_search.widget.dart';
import 'package:ehelp/shared/components/generic_button.widget.dart';
import 'package:ehelp/shared/components/header_background.widget.dart';
import 'package:ehelp/shared/fonts/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../locator.dart';
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: ColorConstants.blackSoft,
            width: double.infinity,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                margin: const EdgeInsets.only(
                  bottom: 24,
                ),
                height: MediaQuery.of(context).size.height / 12,
                child: Row(
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
                              onPressed: () {},
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
              ),
            ),
          ),
          Observer(builder: (_) {
            return Container(
              color: ColorConstants.blackSoft,
              padding: const EdgeInsets.only(left: 24, bottom: 16, right: 24),
              child: Row(
                children: [
                  Flexible(
                    flex: 8,
                    child: DropdownSearch2Widget(
                      items: items,
                      textEditingController: textEditingController,
                      initValue: _controller.serviceSelected,
                      hintText: 'Procurar Serviços',
                      onChanged: (final newValue) {
                        _controller.setServiceSelected(newValue as String);

                        showDialog(
                            context: context,
                            builder: (builder) => const DefaultDialog(
                                child: AdressDialogWidget()));
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
          Container(
            color: ColorConstants.blackSoft,
            child: Container(
              width: double.infinity,
              height: 48,
              decoration: const BoxDecoration(
                color: ColorConstants.whiteBackground,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
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
