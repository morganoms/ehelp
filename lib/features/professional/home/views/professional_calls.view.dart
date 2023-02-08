import 'package:ehelp/features/home/views/components/service_item.widget.dart';
import 'package:ehelp/shared/components/person_picture.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../locator.dart';
import '../../../../shared/colors/constants.dart';
import '../../../../shared/fonts/styles.dart';
import '../view_model/home_professional.view_model.dart';
import 'components/service_item_pro.widget.dart';

class ProfessionalCallsView extends StatefulWidget {
  const ProfessionalCallsView({Key? key}) : super(key: key);

  @override
  State<ProfessionalCallsView> createState() => _ProfessionalCallsViewState();
}

class _ProfessionalCallsViewState extends State<ProfessionalCallsView> {
  late HomeProfessionalViewModel _viewModel;

  @override
  void initState() {
    _viewModel = locator.get<HomeProfessionalViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [ColorConstants.primaryLight, Colors.white],
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
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
                                  style: FontStyles.size16Weight700,
                                ),
                                Text(
                                  'Profissional',
                                  style: FontStyles.size14Weight400,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Observer(builder: (_) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: _viewModel.isAvaliableNow
                                  ? Color.fromARGB(255, 182, 253, 184)
                                  : Colors.white),
                          child: IconButton(
                            icon: Icon(
                              _viewModel.isAvaliableNow
                                  ? Icons.link_rounded
                                  : Icons.link_off_rounded,
                            ),
                            onPressed: () => _viewModel
                                .setAvaliableNow(!_viewModel.isAvaliableNow),
                          ),
                        );
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Chamados Agora',
                      style: FontStyles.size16Weight400,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ServiceItemProWidget(),
                  const SizedBox(
                    height: 48,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Agendamentos',
                      style: FontStyles.size16Weight400,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ...List.generate(
                    10,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ServiceItemWidget(
                        expansive: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
