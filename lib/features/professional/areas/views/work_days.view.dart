import 'package:ehelp/shared/colors/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/locator.dart';
import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/components/generic_button.widget.dart';
import '../../../../shared/fonts/styles.dart';
import '../view_model/home_edit_area.view_model.dart';

class WorkDaysView extends StatefulWidget {
  const WorkDaysView({Key? key}) : super(key: key);

  @override
  State<WorkDaysView> createState() => _WorkDaysViewState();
}

class _WorkDaysViewState extends State<WorkDaysView> {
  late HomeEditAreaViewModel _controller;

  @override
  void initState() {
    _controller = locator.get<HomeEditAreaViewModel>();
    super.initState();
  }

  Widget _buildButton({
    required String buttonTitle,
    required BuildContext context,
    required bool isSelected,
    void Function(bool)? onChanged,
  }) =>
      Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color:
              isSelected ? ColorConstants.greenDark : const Color(0xFFD9D9D9),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        width: MediaQuery.of(context).size.width,
        child: SwitchListTile(
          value: isSelected,
          onChanged: onChanged,
          activeTrackColor: Colors.white,
          activeColor: ColorConstants.primaryColor,
          title: Text(
            buttonTitle,
            style: isSelected
                ? FontStyles.size16Weight700White
                : FontStyles.size16Weight700,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
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
                  value: _controller.isUtilDays,
                  onChanged: (final bool newvalue) =>
                      _controller.setUtilDays(newvalue),
                  activeTrackColor: Colors.grey,
                  activeColor: ColorConstants.greenDark,
                  title: Text(
                    'Somente dias úteis',
                    style: FontStyles.size16Weight700,
                  ),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              Observer(
                builder: (_) => Column(
                  children: _controller.workDaysList
                      .map(
                        (e) => _buildButton(
                          buttonTitle: e.dayName,
                          context: context,
                          isSelected: e.selected,
                          onChanged: (final bool newValue) =>
                              _controller.setSelectionWeekDay(
                                  _controller.workDaysList.indexOf(e),
                                  newValue),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
