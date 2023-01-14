import 'package:ehelp/features/home/views/components/service_item.widget.dart';
import 'package:ehelp/routes/ehelp_routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../shared/components/generic_button.widget.dart';
import '../../../shared/fonts/styles.dart';

class CallingView extends StatefulWidget {
  const CallingView({Key? key}) : super(key: key);

  @override
  State<CallingView> createState() => _CallingViewState();
}

class _CallingViewState extends State<CallingView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 5),
    ).then(
      (value) => Navigator.of(context)
          .pushNamed(EhelpRoutes.clientCallNowConfirmation),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: GenericButton(
          label: 'Cancelar Solicitação',
          color: Colors.red.shade400,
          onPressed: () =>
              Navigator.of(context).pushNamed(EhelpRoutes.clientCallNowCalling),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                    'Chamar Agora',
                    style: FontStyles.size16Weight700,
                  ),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              ServiceItemWidget(),
              Flexible(
                child: Lottie.asset(
                  'assets/animations/calling2.json',
                ),
              ),
              Text(
                'Chamando Profissional',
                style: FontStyles.size20Weight700green,
              ),
              const SizedBox(
                height: 48,
              ),
              Text(
                'Aguarde a confirmação de donibilidade. Se confirmar, o profissional chegará em  até 2 horas.',
                style: FontStyles.size16Weight400,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
