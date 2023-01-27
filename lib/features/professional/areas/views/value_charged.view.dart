import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import '../../../../locator.dart';
import '../../../../shared/components/money_input.widget.dart';
import '../../../../shared/fonts/styles.dart';
import '../view_model/home_edit_area.view_model.dart';

class ValueChargedView extends StatefulWidget {
  ValueChargedView({Key? key}) : super(key: key);

  @override
  State<ValueChargedView> createState() => _ValueChargedViewState();
}

class _ValueChargedViewState extends State<ValueChargedView> {
  late HomeEditAreaViewModel _controller;

  late MoneyMaskedTextController _controllerMoney;

  @override
  void initState() {
    super.initState();
    _controller = locator.get<HomeEditAreaViewModel>();
    _controllerMoney = MoneyMaskedTextController(
      leftSymbol: r'R$ ',
      initialValue: _controller.valuCharged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Observação',
              style: FontStyles.size16Weight700,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
                'Antes de preencher o valor cobrado, lembre que a plataforma cobrará uma taxa de 20% em relação a valor informado. '),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
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
                    'Valor Cobrado',
                    style: FontStyles.size16Weight700,
                  )
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              MenyInput(
                label: const Text('Valor que deseja cobrar'),
                controller: _controllerMoney,
                onChanged: (final double value) {
                  _controllerMoney.updateValue(value);
                  _controller.setValueCharged(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
