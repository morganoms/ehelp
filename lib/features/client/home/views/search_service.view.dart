// ignore_for_file: cascade_invocations

import 'package:ehelp/core/session/session.controller.dart';
import 'package:ehelp/shared/components/dropdown_search.widget.dart';
import 'package:ehelp/shared/components/header_black.widget.dart';
import 'package:ehelp/shared/entity/speciality.entity.dart';
import 'package:ehelp/shared/fonts/styles.dart';
import 'package:ehelp/shared/models/screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../../core/locator.dart';
import '../../../../shared/colors/constants.dart';
import '../../../../shared/components/empty.widget.dart';
import '../../../../shared/components/person_picture.widget.dart';
import '../../../../shared/entity/user/user.entity.dart';
import '../../../professional/home/views/components/service_item_call.widget.dart';
import '../model/entity/home_client.entity.dart';
import '../view_model/controllers/home_client.view_model.dart';
import 'components/service_item.widget.dart';

class SearchServiceView extends StatefulWidget {
  const SearchServiceView({required this.screenData, Key? key})
      : super(key: key);

  final HomeClientEntity screenData;

  @override
  State<SearchServiceView> createState() => _SearchServiceViewState();
}

class _SearchServiceViewState extends State<SearchServiceView> {
  late HomeClientViewModel _controller;
  late SessionController _sessionController;
  late HomeClientEntity _screenData;
  late User _user;
  late IO.Socket socket;

  @override
  void initState() {
    _screenData = widget.screenData;
    _sessionController = locator.get<SessionController>();
    _controller = locator.get<HomeClientViewModel>();
    _user = _sessionController.session!.userAuthenticated;
    initSocket();
    super.initState();
  }

  void initSocket() {
    print('Connecting...');
    socket = IO.io('ws://websocket.ehelpresidencial.com', <String, dynamic>{
      'autoConnect': true,
      'transports': ['websocket'],
    });

    socket.onConnect((_) {
      print('Connection established');
      socket.emit('getServiceStatus', '2');
    });
    socket.on('serviceStatus', (data) => print(data));
    socket.onConnectError((err) => print(err));
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onError((err) => print(err));
  }

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
                Observer(builder: (_) {
                  return SegmentedButton(
                    style: ButtonStyle(
                      side:
                          const MaterialStatePropertyAll<BorderSide>(BorderSide(
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
                      ButtonSegment<int>(
                          value: 1,
                          label: Text('Valor do Serviço'),
                          icon: Icon(Icons.attach_money_outlined)),
                      ButtonSegment(
                          value: 2,
                          label: Text('Avaliações'),
                          icon: Icon(Icons.star)),
                    ],
                    emptySelectionAllowed: true,
                    selected: <int>{_controller.orderByList},
                    onSelectionChanged: (Set<int> newValue) {
                      _controller.setOrderByList(
                          newValue.isEmpty ? 3 : newValue.single);
                    },
                  );
                }),
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
                    min: 0,
                    max: 100.0,
                    values: _controller.valuesRange,
                    interval: 100,
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
                      Flexible(
                        flex: 5,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PersonPicture(pathImageNetwork: _user.photoUrl),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Olá, ${_user.name}!',
                                      style: FontStyles.size16Weight700White,
                                    ),
                                    Text(
                                      'Cliente',
                                      style: FontStyles.size14Weight400white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Observer(builder: (_) {
                        return Visibility(
                          visible: _controller.serviceSelected != null,
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
                          child: DropdownSearch2Widget<SpecialityEntity>(
                            items: _screenData.specialities
                                .map(
                                  (item) => DropdownMenuItem<SpecialityEntity>(
                                    value: item,
                                    child: Text(item.descriptionPortuguese,
                                        style: FontStyles.size16Weight400),
                                  ),
                                )
                                .toList(),
                            textEditingController: textEditingController,
                            initValue: _controller.serviceSelected,
                            hintText: 'Procurar Serviços',
                            onChanged: (final newValue) async {
                              _controller.setServiceSelected(
                                  newValue as SpecialityEntity);
                              await _controller.getHomeSearch();
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
          Observer(builder: (_) {
            return _controller.listState == ScreenState.idle
                ? Visibility(
                    visible: _controller.listProvidersSelected.isNotEmpty,
                    replacement: const EmptyWidget(
                        subtitle: 'Nenhum prestador foi encontrado.'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                            visible: _controller.serviceSelected == null,
                            replacement: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  'Resultados encontrados: ${_controller.listProvidersSelected.length}',
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
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Flexible(
                            child: Column(
                              children: _controller.listProvidersSelected
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: ServiceItemWidget(
                                        indexImage: 4,
                                        cardData: e,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Lottie.asset('assets/animations/v-3-black.json',
                        height: 100),
                  );
          }),
        ],
      ),
    );
  }
}
