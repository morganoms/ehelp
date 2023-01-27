import 'package:flutter/material.dart';

import '../../../../routes/ehelp_routes.dart';
import '../../../../shared/fonts/styles.dart';

class HomeEditAreaView extends StatelessWidget {
  const HomeEditAreaView({Key? key}) : super(key: key);

  Widget _buildButton({
    required String buttonTitle,
    required String buttonRoute,
    required BuildContext context,
  }) =>
      Material(
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed(buttonRoute),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: const Color(0xFFD9D9D9),
            ),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  buttonTitle,
                  style: FontStyles.size16Weight700,
                ),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    'Edição de Especialidade',
                    style: FontStyles.size16Weight700,
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              _buildButton(
                buttonTitle: 'Certificaçao',
                context: context,
                buttonRoute: EhelpRoutes.certificationArea,
              ),
              const SizedBox(
                height: 16,
              ),
              _buildButton(
                buttonTitle: 'Dias de Trabalho',
                context: context,
                buttonRoute: EhelpRoutes.workDays,
              ),
              const SizedBox(
                height: 16,
              ),
              _buildButton(
                buttonTitle: 'Horários de Trabalho',
                context: context,
                buttonRoute: EhelpRoutes.workHours,
              ),
              const SizedBox(
                height: 16,
              ),
              _buildButton(
                buttonTitle: 'Valor Cobrado',
                context: context,
                buttonRoute: EhelpRoutes.valueCharged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
