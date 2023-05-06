import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../locator.dart';
import '../../../../shared/Colors/constants.dart';
import '../../../../shared/components/time_selector.widget.dart';
import '../../../../shared/fonts/styles.dart';
import '../models/working_hours.entity.dart';
import '../view_model/home_edit_area.view_model.dart';

class WorkHoursView extends StatefulWidget {
  const WorkHoursView({Key? key}) : super(key: key);

  @override
  State<WorkHoursView> createState() => _WorkHoursViewState();
}

class _WorkHoursViewState extends State<WorkHoursView> {
  late HomeEditAreaViewModel _controller;

  @override
  void initState() {
    _controller = locator.get<HomeEditAreaViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    'Dias de Trabalho',
                    style: FontStyles.size16Weight700,
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Observer(builder: (_) {
                return SwitchListTile(
                  value: _controller.isComercialHours,
                  onChanged: (final bool newvalue) =>
                      _controller.setComercialHours(newvalue),
                  activeTrackColor: Colors.grey,
                  activeColor: ColorConstants.greenDark,
                  title: Text(
                    'Horário Comercial',
                    style: FontStyles.size16Weight700,
                  ),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              Observer(
                builder: (_) {
                  return Flexible(
                    child: TimeSelector(
                      workHours: _controller.workHoursList,
                      onPressed: (final int index, final bool value) =>
                          _controller.setSelectionWorkHour(index, value),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
