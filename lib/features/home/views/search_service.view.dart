import 'package:ehelp/features/home/views/components/dropdown_search.widget.dart';
import 'package:ehelp/features/home/views/components/service_item.widget.dart';
import 'package:ehelp/shared/components/generic_button.widget.dart';
import 'package:ehelp/shared/fonts/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../locator.dart';
import '../view_model/home_client.view_model.dart';

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
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 36,
            child: Image.asset(
              'assets/images/ehelp.png',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Observer(builder: (_) {
            return Row(
              children: [
                Flexible(
                  flex: 8,
                  child: DropdownSearchWidget(
                    items: items,
                    textEditingController: textEditingController,
                  ),
                ),
                if (_controller.serviceSelected.isNotEmpty)
                  Flexible(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list),
                    ),
                  )
              ],
            );
          }),
          Observer(builder: (_) {
            return Visibility(
              visible: _controller.serviceSelected.isNotEmpty,
              child: Align(
                heightFactor: 1,
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GenericButton(
                      label: 'Agendar',
                      onPressed: () {},
                      height: 25,
                      width: MediaQuery.of(context).size.width / 5,
                      labelStyle: FontStyles.size14Weight500,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GenericButton(
                      label: 'Chamar Agora',
                      onPressed: () {},
                      height: 25,
                      color: Colors.white,
                      borderColor: const Color(0xFF575757),
                      width: MediaQuery.of(context).size.width / 3,
                      labelStyle: FontStyles.size14Weight500colorPrimary,
                    )
                  ],
                ),
              ),
            );
          }),
          Observer(builder: (_) {
            return Visibility(
              visible: _controller.serviceSelected.isEmpty,
              child: Container(
                margin: const EdgeInsets.only(top: 32),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    10,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ServiceItemWidget(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
